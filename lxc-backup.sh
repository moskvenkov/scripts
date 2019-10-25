#!/bin/bash
dumpdir=/mnt/vglunlow/dump/
for lxc in 211 1039
do
vzdump $lxc --mode stop --compress gzip --dumpdir $dumpdir
sleep 10
pct stop $lxc
done
cd $dumpdir
rm -rf ./*.tmp
exit 1
