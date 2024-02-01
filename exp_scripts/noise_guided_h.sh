TOTAL_TASKS=1
BATCH_SIZE=50

CONFIG_FILE_autograd_LR_1_STEP_1='configs/noise_guide_h/sampling_autograd_lr_1_step_1.yml'
RESULT_PATH_autograd_LR_1_STEP_1='experiments/noise_guide_h/sampling_autograd_lr_1_step_1'

CONFIG_FILE_sgd_LR_1_STEP_1='configs/noise_guide_h/sampling_sgd_lr_1_step_1.yml'
RESULT_PATH_sgd_LR_1_STEP_1='experiments/noise_guide_h/sampling_sgd_lr_1_step_1'

CONFIG_FILE_sgd_LR_10_STEP_1='configs/noise_guide_h/sampling_sgd_lr_10_step_1.yml'
RESULT_PATH_sgd_LR_10_STEP_1='experiments/noise_guide_h/sampling_sgd_lr_10_step_1'

CONFIG_FILE_sgd_LR_10_STEP_10='configs/noise_guide_h/sampling_sgd_lr_10_step_10.yml'
RESULT_PATH_sgd_LR_10_STEP_10='experiments/noise_guide_h/sampling_autograd_lr_10_step_10'

CONFIG_FILE_sgd_LR_100_STEP_1='configs/noise_guide_h/sampling_sgd_lr_100_step_1.yml'
RESULT_PATH_sgd_LR_100_STEP_1='experiments/noise_guide_h/sampling_sgd_lr_100_step_1'

CONFIG_FILE_sgd_LR_100_STEP_10='configs/noise_guide_h/sampling_sgd_lr_100_step_10.yml'
RESULT_PATH_sgd_LR_100_STEP_10='experiments/noise_guide_h/sampling_sgd_lr_100_step_10'



# sampling
python -m scripts.sample_guided_h_diffusion ${CONFIG_FILE_autograd_LR_1_STEP_1} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_autograd_LR_1_STEP_1}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_autograd_LR_1_STEP_1} --docking_mode vina_dock  --protein_root data/test_set

# sampling
python -m scripts.sample_guided_h_diffusion ${CONFIG_FILE_sgd_LR_1_STEP_1} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_sgd_LR_1_STEP_1}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_sgd_LR_1_STEP_1} --docking_mode vina_dock  --protein_root data/test_set

# sampling
python -m scripts.sample_guided_h_diffusion ${CONFIG_FILE_sgd_LR_10_STEP_1} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_sgd_LR_10_STEP_1}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_sgd_LR_10_STEP_1} --docking_mode vina_dock  --protein_root data/test_set

# sampling
python -m scripts.sample_guided_h_diffusion ${CONFIG_FILE_sgd_LR_100_STEP_1} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_sgd_LR_100_STEP_1}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_sgd_LR_100_STEP_1} --docking_mode vina_dock  --protein_root data/test_set

# sampling
python -m scripts.sample_guided_h_diffusion ${CONFIG_FILE_sgd_LR_10_STEP_10} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_sgd_LR_10_STEP_10}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_sgd_LR_10_STEP_10} --docking_mode vina_dock  --protein_root data/test_set

# sampling
python -m scripts.sample_guided_h_diffusion ${CONFIG_FILE_sgd_LR_100_STEP_10} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_sgd_LR_100_STEP_10}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_sgd_LR_100_STEP_10} --docking_mode vina_dock  --protein_root data/test_set
