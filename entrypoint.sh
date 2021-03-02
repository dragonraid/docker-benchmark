#!/bin/bash

TEST_DIR='/var/tmp'

# Start benchmarking after the spare resources are removed
echo '>>> Sleeping for 10 seconds, to wait until spare resources are removed'
sleep 10

# Test write IOPS
fio \
    --name=write_iops \
    --directory=${TEST_DIR} \
    --size=1G \
    --time_based \
    --runtime=60s \
    --ramp_time=2s \
    --ioengine=libaio \
    --direct=1 \
    --verify=0 \
    --bs=4K \
    --iodepth=64 \
    --rw=randwrite \
    --group_reporting=1
