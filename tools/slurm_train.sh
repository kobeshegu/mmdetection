#!/usr/bin/env bash

    # --ntasks=${GPUS} \
    # --ntasks-per-node=${GPUS_PER_NODE} \

# set -x

# PARTITION=digitalcity
# JOB_NAME=LVIS
# CONFIG=configs/lvis/mask_rcnn_r50_fpn_sample1e-3_mstrain_1x_lvis_v1.py
# WORK_DIR=/mnt/petrelfs/yangmengping/LVISdetection
# GPUS=8
# GPUS_PER_NODE=${GPUS_PER_NODE:-8}
# CPUS_PER_TASK=16
# SRUN_ARGS=${SRUN_ARGS:-""}
# PY_ARGS=${@:5}

# PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \
# srun -p ${PARTITION} \
#     --job-name=${JOB_NAME} \
#     --gres=gpu:${GPUS_PER_NODE} \
#     --cpus-per-task=${CPUS_PER_TASK} \
#     --kill-on-bad-exit=1 \
#     ${SRUN_ARGS} \
#     python -u tools/train.py ${CONFIG} --work-dir=${WORK_DIR} --launcher="slurm" ${PY_ARGS}

    # --ntasks-per-node=${GPUS_PER_NODE} \
#!/usr/bin/env bash

#!/usr/bin/env bash

set -x

PARTITION=digitalcity
JOB_NAME=LVIS
CONFIG=configs/lvis/mask_rcnn_r50_fpn_sample1e-3_mstrain_1x_lvis_v1.py
WORK_DIR=/mnt/petrelfs/yangmengping/LVISdetection
GPUS=${GPUS:-8}
GPUS_PER_NODE=${GPUS_PER_NODE:-8}
CPUS_PER_TASK=${CPUS_PER_TASK:-16}
SRUN_ARGS=${SRUN_ARGS:-""}
PY_ARGS=${@:5}

PYTHONPATH="$(dirname $0)/..":$PYTHONPATH \
srun -p ${PARTITION} \
    --job-name=${JOB_NAME} \
    --gres=gpu:${GPUS_PER_NODE} \
    --ntasks=${GPUS} \
    --ntasks-per-node=${GPUS_PER_NODE} \
    --cpus-per-task=${CPUS_PER_TASK} \
    --kill-on-bad-exit=1 \
    ${SRUN_ARGS} \
    python -u tools/train.py ${CONFIG} --work-dir=${WORK_DIR} --launcher="slurm" ${PY_ARGS}
