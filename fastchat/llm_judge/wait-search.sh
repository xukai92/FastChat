#!/usr/bin/env bash
while [ $(screen -ls | grep search | wc -l) -ne 0 ]
do
    echo "Still searching.."
    sleep 30
done
