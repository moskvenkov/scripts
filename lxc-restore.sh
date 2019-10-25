#!/bin/bash
storage=fit3tb
for vmid in $(ls -la | grep vzdump-lxc |  awk '{print $9}'  | cut -d '-' -f3)
do
pct restore $vmid vzdump-lxc-$vmid*.gz --storage $storage
pct start $vmid
done
exit 1
