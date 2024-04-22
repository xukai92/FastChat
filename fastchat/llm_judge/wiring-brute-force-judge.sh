#!/usr/bin/env bash

WORLD_SIZE=10
for rank in {0..9}
do
    for cuda in {0..7}
        do
        for iter in {0..3}
            do
            suffix="rank=$rank=cuda=$cuda=iter=$iter"
            cfg_path="/xuk/wiring/data/cfgs-$WORLD_SIZE/cfg-$suffix.yaml"
            ans_path="data/mt_bench/model_answer/merlinite-7b-$suffix.jsonl"
            if [ -f $ans_path ]; then
                echo "working on $ans_path ..."
                /root/fsdp/bin/python gen_judgment.py \
                    --bench-name mt_bench \
                    --model-list merlinite-7b-$suffix \
                    --parallel 20
            fi
        done
    done
done
test -d /xuk/wiring/data/model_judgment || mkdir -p /xuk/wiring/data/model_judgment
cp data/mt_bench/model_judgment/gpt-4-single.jsonl \
    /xuk/wiring/data/model_judgment/gpt-4-single.jsonl