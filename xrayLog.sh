#!/bin/sh
 
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geoip.dat -O /usr/local/share/xray/geoip.dat
wget https://github.com/Loyalsoldier/v2ray-rules-dat/releases/latest/download/geosite.dat -O /usr/local/share/xray/geosite.dat
 
cd /var/log/xray/
newAccessLog="access.`date +%Y-%m-%d`.log"
newErrorLog="error.`date +%Y-%m-%d`.log"
 
mv access.log $newAccessLog
mv error.log $newErrorLog
 
#创建日志文件
touch access.log error.log
chown nobody:nogroup access.log
chown nobody:nogroup error.log
 
#reload xray
systemctl restart xray
 
#压缩日志文件
tar -zcvf $newAccessLog.tar.gz $newAccessLog --remove-files
tar -zcvf $newErrorLog.tar.gz $newErrorLog --remove-files
