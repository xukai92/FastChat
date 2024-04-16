#!/usr/bin/env bash

for cuda in {0..7}
    do
    for iter in {0..3}
        do
        suffix="rank=$RANK=cuda=$cuda=iter=$iter"
        cfg_path="/xuk/wiring/data/cfgs-$WORLD_SIZE/cfg-$suffix.yaml"
        ans_path="data/mt_bench/model_answer/merlinite-7b-$suffix.jsonl"
        if [ -f $ans_path ]; then
            /root/fsdp/bin/python gen_judgment.py \
                --bench-name mt_bench \
                --model-list merlinite-7b-$suffix \
                --parallel 40
        fi
    done
done
cp data/mt_bench/model_judgement/gpt-4-single.jsonl \
    /xuk/wiring/data/model_judgement/gpt-4-single-rank=$RANK.jsonl
