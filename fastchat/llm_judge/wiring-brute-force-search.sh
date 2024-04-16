cuda=$1

for iter in {0..34}
    do
    suffix="cuda=$cuda=iter=$iter"
    cfg_path="/root/notebooks/looped/cfgs/cfg-$suffix.yaml"
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
    fi
done