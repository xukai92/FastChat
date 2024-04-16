cuda=$1

for iter in {0..3}
    do
    suffix="rank=$RANK=cuda=$cuda=iter=$iter"
    cfg_path="/xuk/wiring/data/cfgs-world_size=$WORLD_SIZE/cfg-$suffix.yaml"
    if [ -f $cfg_path ]; then
        CUDA_VISIBLE_DEVICES=$cuda /root/fsdp/bin/python gen_model_answer.py \
            --model-path ibm/merlinite-7b \
            --cfg-path $cfg_path \
            --model-id merlinite-7b-$suffix \
            --max-new-token 1024 \
            --num-choices 1 \
            --num-gpus-per-model 1 \
            --num-gpus-total 1  \
            --dtype bfloat16
	cp data/mt_bench/model_answer/merlinite-7b-$suffix.jsonl \
	    /xuk/wiring/data/model_answer/merlinite-7b-$suffix.jsonl
    fi
done
