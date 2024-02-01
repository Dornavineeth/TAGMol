TOTAL_TASKS=1
BATCH_SIZE=50

CONFIG_FILE_CORD_1_CAT_1='configs/universal/sampling_guided_cord_1_cat_1.yml'
RESULT_PATH__CORD_1_CAT_1='experiments/universal/baseline_cord_1_cat_1'

CONFIG_FILE_CORD_1_CAT_0='configs/universal/sampling_guided_cord_1_cat_0.yml'
RESULT_PATH__CORD_1_CAT_0='experiments/universal/baseline_cord_1_cat_0'

CONFIG_FILE_CORD_1_CAT_0_1='configs/universal/sampling_guided_cord_1_cat_0_1.yml'
RESULT_PATH__CORD_1_CAT_0_1='experiments/universal/baseline_cord_1_cat_0_1'

# sampling
python -m scripts.sample_guided_diffusion ${CONFIG_FILE_CORD_1_CAT_1} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH__CORD_1_CAT_1}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH__CORD_1_CAT_1} --docking_mode vina_dock  --protein_root data/test_set

# # sampling
# python -m scripts.sample_guided_diffusion ${CONFIG_FILE_CORD_1_CAT_0} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH__CORD_1_CAT_0}
# # evaluation
# python scripts/evaluate_diffusion.py ${RESULT_PATH__CORD_1_CAT_0} --docking_mode vina_dock  --protein_root data/test_set

# sampling
python -m scripts.sample_guided_diffusion ${CONFIG_FILE_CORD_1_CAT_0_1} -i 0 --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH__CORD_1_CAT_0_1}
# evaluation
python scripts/evaluate_diffusion.py ${RESULT_PATH__CORD_1_CAT_0_1} --docking_mode vina_dock  --protein_root data/test_set