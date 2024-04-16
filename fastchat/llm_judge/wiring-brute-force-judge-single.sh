#!/usr/bin/env bash

suffix="cuda=7=iter=5"
cfg_path="/root/notebooks/looped/cfgs/cfg-$suffix.yaml"
ans_path="/root/notebooks/looped/FastChat/fastchat/llm_judge/data/mt_bench/model_answer/merlinite-7b-$suffix.jsonl"
if [ -f $ans_path ]; then
    /root/fsdp/bin/python gen_judgment.py \
        --bench-name mt_bench \
        --model-list merlinite-7b-$suffix \
        --parallel 10
fi