#!/usr/bin/env bash

PYTHON=${PYTHON:-"python"}
CONFIG=./configs/retinanet_r50_fpn_050x_exp1.py
GPUS=4

CUDA_VISIBLE_DEVICES=4,5,6,7 $PYTHON -m torch.distributed.launch --nproc_per_node=$GPUS --master_port 1000 \
    $(dirname "$0")/train.py $CONFIG --launcher pytorch ${@:3}
