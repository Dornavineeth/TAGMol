# TAGMol : Target-Aware Gradient-guided  Molecule Generation

## Installation

### Dependency

The code has been tested in the following environment:

### Install via Conda and Pip
```bash
conda create -n tagmol python=3.8.17
conda activate tagmol
conda install pytorch=1.13.1 pytorch-cuda=11.6 -c pytorch -c nvidia
conda install pyg=2.2.0 -c pyg
conda install rdkit=2022.03.2 openbabel=3.1.1 tensorboard=2.13.0 pyyaml=6.0 easydict=1.9 python-lmdb=1.4.1 -c conda-forge

# For Vina Docking
pip install meeko==0.1.dev3 scipy pdb2pqr vina==1.2.2 
python -m pip install git+https://github.com/Valdes-Tresanco-MS/AutoDockTools_py3
```

### (Alternatively) Install with .yml file

```bash
conda env create -f environment.yml
```

**IMPORTANT NOTE:** You might have to do the following to append the path of the root working directory.
```bash
export PYTHONPATH=".":$PYTHONPATH
```

-----

# Target-Aware Molecule Generation
## Data

If you want to process the dataset from scratch, you need to download CrossDocked2020 v1.1 from [here](https://bits.csb.pitt.edu/files/crossdock2020/), save it into `data/CrossDocked2020`, and run the scripts in `scripts/data_preparation`:
* [clean_crossdocked.py](scripts/data_preparation/clean_crossdocked.py) will filter the original dataset and keep the ones with RMSD < 1A.
It will generate a `index.pkl` file and create a new directory containing the original filtered data (corresponds to `crossdocked_v1.1_rmsd1.0.tar.gz` in the drive). *You don't need these files if you have downloaded .lmdb file.*
    ```bash
    python scripts/data_preparation/clean_crossdocked.py --source data/CrossDocked2020 --dest data/crossdocked_v1.1_rmsd1.0 --rmsd_thr 1.0
    ```
* [extract_pockets.py](scripts/data_preparation/extract_pockets.py) will clip the original protein file to a 10A region around the binding molecule. E.g.
    ```bash
    python scripts/data_preparation/extract_pockets.py --source data/crossdocked_v1.1_rmsd1.0 --dest data/crossdocked_v1.1_rmsd1.0_pocket10
    ```
* [split_pl_dataset.py](scripts/data_preparation/split_pl_dataset.py) will split the training and test set. We use the same split `split_by_name.pt` as 
[AR](https://arxiv.org/abs/2203.10446) and [Pocket2Mol](https://arxiv.org/abs/2205.07249)- data folder.
    ```bash
    python scripts/data_preparation/split_pl_dataset.py --path data/crossdocked_v1.1_rmsd1.0_pocket10 --dest data/crossdocked_pocket10_pose_split.pt --fixed_split data/split_by_name.pt
    ```
## Training
### Training Diffusion model from scratch
```bash
python scripts/train_diffusion.py configs/training.yml
```
### Training Guide model from scratch


#### BA

```bash
python scripts/train_dock_guide.py configs/training_dock_guide.yml
```

#### QED

```bash
python scripts/train_dock_guide.py configs/training_dock_guide_qed.yml
```

#### SA

```bash
python scripts/train_dock_guide.py configs/training_dock_guide_sa.yml
```

*NOTE: The outputs are saved in `logs/` by default.*


---

## Sampling
### Sampling for pockets in the testset

#### BackBone
```bash
python scripts/sample_diffusion.py configs/sampling.yml --data_id {i} # Replace {i} with the index of the data. i should be between 0 and 99 for the testset.
```

We have a bash file that can run the inference for the entire test set in a loop.
```bash
bash scripts/batch_sample_diffusion.sh configs/sampling.yml backbone
```
The output will be stored in `experiments/backbone`.
The following variables: `BATCH_SIZE`, `NODE_ALL`, `NODE_THIS` and `START_IDX`, can be modified in the script file, if required.


#### BackBone + Gradient Guidance
```bash
python scripts/sample_multi_guided_diffusion.py [path-to-config.yml] --data_id {i} # Replace {i} with the index of the data. i should be between 0 and 99 for the testset.
```

To run inference on all 100 targets in the test set:
```bash
bash scripts/batch_sample_multi_guided_diffusion.sh [path-to-config.yml] [output-dir-name]
```

The outputs are stored in `experiments_multi/[output-dir-name]`when run using the bash file. The config files are available in `configs/noise_guide_multi`.
- Single-objective guidance
    - BA:       `sampling_guided_ba_1.yml`
    - QED:      `sampling_guided_qed_1.yml`
    - SA:       `sampling_guided_sa_1.yml`
- Dual-objective guidance
    - QED + BA:     `sampling_guided_qed_0.5_ba_0.5.yml`
    - SA + BA:      `sampling_guided_sa_0.5_ba_0.5.yml`
    - QED + SA:     `sampling_guided_qed_0.5_sa_0.5.yml`
- Multi-objective guidance (our main model)
    - QED + SA + BA:    `sampling_guided_qed_0.33_sa_0.33_ba_0.34.yml`


For example, to run the multi-objective setting (i.e., our model):
```bash
bash scripts/batch_sample_multi_guided_diffusion.sh configs/noise_guide_multi/sampling_guided_qed_0.33_sa_0.33_ba_0.34.yml qed_0.33_sa_0.33_ba_0.34
```

---
## Evaluation

### Evaluating Guide models
```bash
python scripts/eval_dock_guide.py --ckpt_path [path-to-checkpoint.pt]
```

### Evaluation from sampling results
```bash
python scripts/evaluate_diffusion.py {OUTPUT_DIR} --docking_mode vina_score --protein_root data/test_set
```
The docking mode can be chosen from {qvina, vina_score, vina_dock, none}

_NOTE: It will take some time to prepare pqdqt and pqr files when you run the evaluation code with vina_score/vina_dock docking mode for the first time._


