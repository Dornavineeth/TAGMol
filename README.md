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

[TODO]

---

## Sampling
### Sampling for pockets in the testset

BackBone
```bash
python scripts/sample_diffusion.py configs/sampling.yml --data_id {i} # Replace {i} with the index of the data. i should be between 0 and 99 for the testset.
```

BackBone + Multi-Objective Gradient Guidance
```bash
python scripts/sample_multi_guided_diffusion.py configs/sampling_guided.yml --data_id {i} # Replace {i} with the index of the data. i should be between 0 and 99 for the testset.
```

---
## Evaluation
### Evaluation from sampling results
```bash
python scripts/evaluate_diffusion.py {OUTPUT_DIR} --docking_mode vina_score --protein_root data/test_set
```
The docking mode can be chosen from {qvina, vina_score, vina_dock, none}

_NOTE: It will take some time to prepare pqdqt and pqr files when you run the evaluation code with vina_score/vina_dock docking mode for the first time._


