cd /etc/pam.d

nano common-session-noninteractive

insert  session [success=1 default=ignore] pam_succeed_if.so service in cron quiet use_uid  ABOVE  session required pam_unix.so




crontab -e 

add  30 0 * * * /var/log/xray/scripts/xrayLog.sh