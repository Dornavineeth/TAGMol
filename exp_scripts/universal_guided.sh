TOTAL_TASKS=1
BATCH_SIZE=50

CONFIG_FILE_CORD_1_CAT_1_REC_0='configs/universal/sampling_guided_cord_1_cat_1_rec_0.yml'
RESULT_PATH_CORD_1_CAT_1_REC_0='experiments/universal/universal_cord_1_cat_1_rec_0'

CONFIG_FILE_CORD_1_CAT_1_REC_1='configs/universal/sampling_guided_cord_1_cat_1_rec_1.yml'
RESULT_PATH_CORD_1_CAT_1_REC_1='experiments/universal/universal_cord_1_cat_1_rec_1'

CONFIG_FILE_CORD_1_CAT_1_REC_5='configs/universal/sampling_guided_cord_1_cat_1_rec_5.yml'
RESULT_PATH_CORD_1_CAT_1_REC_5='experiments/universal/universal_cord_1_cat_1_rec_5'

CONFIG_FILE_CORD_1_CAT_1_REC_10='configs/universal/sampling_guided_cord_1_cat_1_rec_10.yml'
RESULT_PATH_CORD_1_CAT_1_REC_10='experiments/universal/universal_cord_1_cat_1_rec_10'

CONFIG_FILE_CORD_0_CAT_0_REC_1='configs/universal/sampling_guided_cord_0_cat_0_rec_1.yml'
RESULT_PATH_CORD_0_CAT_0_REC_1='experiments/universal/universal_cord_0_cat_0_rec_1'

CONFIG_FILE_CORD_0_CAT_0_REC_5='configs/universal/sampling_guided_cord_0_cat_0_rec_5.yml'
RESULT_PATH_CORD_0_CAT_0_REC_5='experiments/universal/universal_cord_0_cat_0_rec_5'

CONFIG_FILE_CORD_10_CAT_1_REC_1='configs/universal/sampling_guided_cord_10_cat_1_rec_1.yml'
RESULT_PATH_CORD_10_CAT_1_REC_1='experiments/universal/universal_cord_10_cat_1_rec_1'

CONFIG_FILE_CORD_5_CAT_0_REC_1='configs/universal/sampling_guided_cord_5_cat_0_rec_1.yml'
RESULT_PATH_CORD_5_CAT_0_REC_1='experiments/universal/universal_cord_5_cat_0_rec_1'


# # # sampling
# python -m scripts.sample_universal_guided_diffusion ${CONFIG_FILE_CORD_0_CAT_0_REC_1} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_CORD_0_CAT_0_REC_1}
# # evaluation
# python scripts/evaluate_diffusion.py ${RESULT_PATH_CORD_0_CAT_0_REC_1} --docking_mode vina_dock  --protein_root data/test_set

sampling
python -m scripts.sample_universal_guided_diffusion ${CONFIG_FILE_CORD_1_CAT_1_REC_1} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_CORD_1_CAT_1_REC_1}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_CORD_1_CAT_1_REC_1} --docking_mode vina_dock  --protein_root data/test_set


# # sampling
# python -m scripts.sample_universal_guided_diffusion ${CONFIG_FILE_CORD_1_CAT_1_REC_0} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_CORD_1_CAT_1_REC_0}
# # evaluation
# python scripts/evaluate_diffusion.py ${RESULT_PATH_CORD_1_CAT_1_REC_0} --docking_mode vina_dock  --protein_root data/test_set

# # sampling
# python -m scripts.sample_universal_guided_diffusion ${CONFIG_FILE_CORD_1_CAT_1_REC_10} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_CORD_1_CAT_1_REC_10}
# # evaluation
# python scripts/evaluate_diffusion.py ${RESULT_PATH_CORD_1_CAT_1_REC_10} --docking_mode vina_dock  --protein_root data/test_set

# sampling
python -m scripts.sample_universal_guided_diffusion ${CONFIG_FILE_CORD_0_CAT_0_REC_5} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_CORD_0_CAT_0_REC_5}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_CORD_0_CAT_0_REC_5} --docking_mode vina_dock  --protein_root data/test_set

# sampling
python -m scripts.sample_universal_guided_diffusion ${CONFIG_FILE_CORD_1_CAT_1_REC_5} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_CORD_1_CAT_1_REC_5}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH_CORD_1_CAT_1_REC_5} --docking_mode vina_dock  --protein_root data/test_set


# # sampling
# python -m scripts.sample_universal_guided_diffusion ${CONFIG_FILE_CORD_10_CAT_1_REC_1} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_CORD_10_CAT_1_REC_1}
# # evaluation
# python scripts/evaluate_diffusion.py ${RESULT_PATH_CORD_10_CAT_1_REC_1} --docking_mode vina_dock  --protein_root data/test_set

# # sampling
# python -m scripts.sample_universal_guided_diffusion ${CONFIG_FILE_CORD_5_CAT_0_REC_1} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH_CORD_5_CAT_0_REC_1}
# # evaluation
# python scripts/evaluate_diffusion.py ${RESULT_PATH_CORD_5_CAT_0_REC_1} --docking_mode vina_dock  --protein_root data/test_set