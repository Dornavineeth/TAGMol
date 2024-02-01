TOTAL_TASKS=1
BATCH_SIZE=50


CONFIG_FILE_rec_0='configs/guided_beam/sampling_guided_rec_0.yml'
RESULT_PATH_rec_0='experiments/guided_beam/baseline_rec_0'

CONFIG_FILE_topk_5_rec_1_till_900='configs/guided_beam/sampling_guided_topk_5_rec_1_till_900.yml'
RESULT_PATH_topk_5_rec_1_till_900='experiments/guided_beam/baseline_topk_5_rec_1_till_900'

CONFIG_FILE_topk_5_rec_1_till_990='configs/guided_beam/sampling_guided_topk_5_rec_1_till_990.yml'
RESULT_PATH_topk_5_rec_1_till_990='experiments/guided_beam/baseline_topk_5_rec_1_till_990'

CONFIG_FILE_topk_10_rec_1_till_0='configs/guided_beam/sampling_guided_topk_10_rec_1_till_0.yml'
RESULT_PATH_topk_10_rec_1_till_0='experiments/guided_beam/baseline_topk_10_rec_1_till_0'

CONFIG_FILE_topk_40_rec_1_till_900='configs/guided_beam/sampling_guided_topk_40_rec_1_till_900.yml'
RESULT_PATH_topk_40_rec_1_till_900='experiments/guided_beam/baseline_topk_40_rec_1_till_900'

CONFIG_FILE_topk_40_rec_1_till_990='configs/guided_beam/sampling_guided_topk_40_rec_1_till_990.yml'
RESULT_PATH_topk_40_rec_1_till_990='experiments/guided_beam/baseline_topk_40_rec_1_till_990'

CONFIG_FILE_topk_48_rec_1_till_900='configs/guided_beam/sampling_guided_topk_48_rec_1_till_900.yml'
RESULT_PATH_topk_48_rec_1_till_900='experiments/guided_beam/baseline_topk_48_rec_1_till_900'

CONFIG_FILE_topk_48_rec_1_till_990='configs/guided_beam/sampling_guided_topk_48_rec_1_till_990.yml'
RESULT_PATH_topk_48_rec_1_till_990='experiments/guided_beam/baseline_topk_48_rec_1_till_990'

# # sampling
# python -m scripts.sample_guided_diffusion_beam ${CONFIG_FILE_rec_0} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_rec_0}
# # evaluation
# python scripts/evaluate_diffusion.py ${RESULT_PATH_rec_0} --docking_mode vina_dock  --protein_root data/test_set



# # sampling
# python -m scripts.sample_guided_diffusion_beam ${CONFIG_FILE_topk_5_rec_1_till_900} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_topk_5_rec_1_till_900}
# # evaluation
# python scripts/evaluate_diffusion.py ${RESULT_PATH_topk_5_rec_1_till_900} --docking_mode vina_dock  --protein_root data/test_set


# sampling
# python -m scripts.sample_guided_diffusion_beam ${CONFIG_FILE_topk_5_rec_1_till_990} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_topk_5_rec_1_till_990}
# # evaluation
# python scripts/evaluate_diffusion.py ${RESULT_PATH_topk_5_rec_1_till_990} --docking_mode vina_dock  --protein_root data/test_set

# sampling
# python -m scripts.sample_guided_diffusion_beam ${CONFIG_FILE_topk_10_rec_1_till_0} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_topk_10_rec_1_till_0}
# # evaluation
# python scripts/evaluate_diffusion.py ${RESULT_PATH_topk_10_rec_1_till_0} --docking_mode vina_dock  --protein_root data/test_set


# # sampling
# python -m scripts.sample_guided_diffusion_beam ${CONFIG_FILE_topk_40_rec_1_till_900} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_topk_40_rec_1_till_900}
# # evaluation
# python scripts/evaluate_diffusion.py ${RESULT_PATH_topk_40_rec_1_till_900} --docking_mode vina_dock  --protein_root data/test_set


# # sampling
# python -m scripts.sample_guided_diffusion_beam ${CONFIG_FILE_topk_40_rec_1_till_990} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_topk_40_rec_1_till_990}
# # evaluation
# python scripts/evaluate_diffusion.py ${RESULT_PATH_topk_40_rec_1_till_990} --docking_mode vina_dock  --protein_root data/test_set

# sampling
python -m scripts.sample_guided_diffusion_beam ${CONFIG_FILE_topk_48_rec_1_till_900} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_topk_48_rec_1_till_900}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_topk_48_rec_1_till_900} --docking_mode vina_dock  --protein_root data/test_set


# sampling
python -m scripts.sample_guided_diffusion_beam ${CONFIG_FILE_topk_48_rec_1_till_990} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_topk_48_rec_1_till_990}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_topk_48_rec_1_till_990} --docking_mode vina_dock  --protein_root data/test_set