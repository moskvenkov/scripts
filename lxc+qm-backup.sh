#!/bin/bash
dumpdir=/mnt/pve/backup/dump/
for quemuvm in $(qm list | awk '{print $1}')
do
vzdump $quemuvm --mode snapshot --compress gzip --dumpdir $dumpdir
done
for lxc in $(pct list | awk '{print $1}')
do
vzdump $lxc --mode snapshot --compress gzip --dumpdir $dumpdir
done
mkdir $dumpdir/logs
mv $dumpdir/*.log $dumpdir/logs
rm -rf $dumpdir/*.tmp
exit 1
