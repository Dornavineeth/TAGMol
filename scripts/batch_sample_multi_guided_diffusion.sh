TOTAL_TASKS=100
BATCH_SIZE=50

if [ $# != 2 ]; then
    echo "Error: 2 arguments required."
    exit 1
fi

CONFIG_FILE=$1
RESULT_PATH="experiments_multi/$2"
NODE_ALL=1
NODE_THIS=0
START_IDX=0

# numbers=(70 44 92 80 49 81 85 22 59 60)

for ((i=$START_IDX;i<$TOTAL_TASKS;i++)); do
# ## now loop through the above array
# for i in "${numbers[@]}"; do
    NODE_TARGET=$(($i % $NODE_ALL))
    if [ $NODE_TARGET == $NODE_THIS ]; then
        echo "Task ${i} assigned to this worker (${NODE_THIS})"
        python -m scripts.sample_multi_guided_diffusion ${CONFIG_FILE} -i ${i} --batch_size ${BATCH_SIZE} --result_path ${RESULT_PATH}
    fi
done

python scripts/evaluate_diffusion.py ${RESULT_PATH} --docking_mode none  --protein_root data/test_set
python scripts/evaluate_diffusion.py ${RESULT_PATH} --docking_mode vina_score  --protein_root data/test_set & 