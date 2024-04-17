#!/usr/bin/env bash
while [ $(screen -ls | grep search | wc -l) -ne 0 ]
do
    echo "Still searching.."
    echo "$(screen -ls)"
    sleep 30
done
