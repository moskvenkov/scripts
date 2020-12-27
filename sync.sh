#!/bin/bash
sshfs 192.168.0.20:/mnt /mnt/freenas/
timestamp=`date +%Y-%m-%d`
log_start_date=`date +%Y-%m-%d-%H-%H-%S`
touch /data/logs/$timestamp.log
echo $log_start_date > /data/logs/$timestamp.log
rsync -avzp --stats --progress /mnt/freenas/main/ /data/main/ >> /data/logs/$timestamp.log
sync
echo 'rsync done'
xdelta3 -f -s /data/1c/acc/buh.1CD /data/main/1c/1CBases/BUH/acc2019/1Cv8.1CD /data/1c/acc/$timestamp.xdelta
xdelta3 -f -s /data/1c/zup/veselov/zup.vvv.1CD /data/main/1c/1CBases/ЗУП/3.0/ВВВ/1Cv8.1CD /data/1c/zup/veselov/$timestamp.xdelta
xdelta3 -f -s /data/1c/zup/igit/zup.igit.1CD /data/main/1c/1CBases/ЗУП/3.0/ИГИТ/1Cv8.1CD /data/1c/zup/igit/$timestamp.xdelta
xdelta3 -f -s /data/1c/zup/yagodkin/zup.ysa.1CD /data/main/1c/1CBases/ЗУП/3.0/ЯСА/1Cv8.1CD /data/1c/zup/yagodkin/$timestamp.xdelta
log_end_date=`date +%Y-%m-%d-%H-%H-%S`
echo $log_end_date >> /data/logs/$timestamp.log
sync
sleep 30
umount /mnt/freenas
exit 0
