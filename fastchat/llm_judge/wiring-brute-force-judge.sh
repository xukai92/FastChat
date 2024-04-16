#!/usr/bin/env bash

for rank in {0..9}
    do
    for cuda in {0..7}
        do
        for iter in {0..3}
            do
            suffix="rank=$rank=cuda=$cuda=iter=$iter"
            cfg_path="/root/notebooks/looped/cfgs/cfg-$suffix.yaml"
            ans_path="/root/notebooks/looped/FastChat/fastchat/llm_judge/data/mt_bench/model_answer/merlinite-7b-$suffix.jsonl"
            if [ -f $ans_path ]; then
                /root/fsdp/bin/python gen_judgment.py \
                    --bench-name mt_bench \
                    --model-list merlinite-7b-$suffix \
                    --parallel 40
            fi
        done
    done
done
