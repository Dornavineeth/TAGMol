TOTAL_TASKS=1
BATCH_SIZE=20


CONFIG_FILE_SGD_LR_1_STEP_1='configs/guided_h_tuning_lr/sampling_sgd_lr_1_step_1.yml'
RESULT_PATH_SGD_LR_1_STEP_1='experiments/test_targtediff_guided_h_tuning_lr/layer_last/sgd_lr_1_step_1'
LOG_SGD_LR_1_STEP_1='experiments/test_targtediff_guided_h_tuning_lr/layer_last/sgd_lr_1_step_1.txt'

CONFIG_FILE_SGD_LR_10_STEP_1='configs/guided_h_tuning_lr/sampling_sgd_lr_10_step_1.yml'
RESULT_PATH_SGD_LR_10_STEP_1='experiments/test_targtediff_guided_h_tuning_lr/layer_last/sgd_lr_10_step_1'
LOG_SGD_LR_10_STEP_1='experiments/test_targtediff_guided_h_tuning_lr/layer_last/sgd_lr_10_step_1.txt'

CONFIG_FILE_SGD_LR_10_STEP_10='configs/guided_h_tuning_lr/sampling_sgd_lr_10_step_10.yml'
RESULT_PATH_SGD_LR_10_STEP_10='experiments/test_targtediff_guided_h_tuning_lr/layer_last/sgd_lr_10_step_10'
LOG_SGD_LR_10_STEP_10='experiments/test_targtediff_guided_h_tuning_lr/layer_last/sgd_lr_10_step_10.txt'

CONFIG_FILE_SGD_LR_100_STEP_1='configs/guided_h_tuning_lr/sampling_sgd_lr_100_step_1.yml'
RESULT_PATH_SGD_LR_100_STEP_1='experiments/test_targtediff_guided_h_tuning_lr/layer_last/sgd_lr_100_step_1'
LOG_SGD_LR_100_STEP_1='experiments/test_targtediff_guided_h_tuning_lr/layer_last/sgd_lr_100_step_1.txt'

CONFIG_FILE_SGD_LR_100_STEP_10='configs/guided_h_tuning_lr/sampling_sgd_lr_100_step_10.yml'
RESULT_PATH_SGD_LR_100_STEP_10='experiments/test_targtediff_guided_h_tuning_lr/layer_last/sgd_lr_100_step_10'
LOG_SGD_LR_100_STEP_10='experiments/test_targtediff_guided_h_tuning_lr/layer_last/sgd_lr_100_step_10.txt'



# sampling
python -m scripts.sample_guided_h_diffusion ${CONFIG_FILE_SGD_LR_1_STEP_1} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_SGD_LR_1_STEP_1} >> ${LOG_SGD_LR_1_STEP_1}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_SGD_LR_1_STEP_1} --docking_mode vina_dock  --protein_root data/test_set

# sampling
python -m scripts.sample_guided_h_diffusion ${CONFIG_FILE_SGD_LR_10_STEP_1} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_SGD_LR_10_STEP_1} >> ${LOG_SGD_LR_10_STEP_1}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_SGD_LR_10_STEP_1} --docking_mode vina_dock  --protein_root data/test_set

# sampling
python -m scripts.sample_guided_h_diffusion ${CONFIG_FILE_SGD_LR_10_STEP_10} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_SGD_LR_10_STEP_10}  >> ${LOG_SGD_LR_10_STEP_10}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_SGD_LR_10_STEP_10} --docking_mode vina_dock  --protein_root data/test_set

# sampling
python -m scripts.sample_guided_h_diffusion ${CONFIG_FILE_SGD_LR_100_STEP_1} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_SGD_LR_100_STEP_1}  >> ${LOG_SGD_LR_100_STEP_1}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_SGD_LR_100_STEP_1} --docking_mode vina_dock  --protein_root data/test_set

# sampling
python -m scripts.sample_guided_h_diffusion ${CONFIG_FILE_SGD_LR_100_STEP_10} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_SGD_LR_100_STEP_10} >> ${LOG_SGD_LR_100_STEP_10}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_SGD_LR_100_STEP_10} --docking_mode vina_dock  --protein_root data/test_set

