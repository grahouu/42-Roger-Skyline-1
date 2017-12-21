#!/bin/bash

if ! [ -e "/etc/crontab" ]
then
	printf "%s doesn't exist\n" "$2"
	exit 2
elif ! [ -e "/etc/crontab_tmp" ]
then
	sudo cat /etc/crontab > /etc/crontab_tmp
fi

tmp_md5=$( md5 "/etc/crontab_tmp" | awk '{print $1}')
origin_md5=$( md5 "/etc/crontab" | awk '{print $1}')

if [ "$origin_md5" == "$tmp_md5" ]
then
	printf "No modification \n"
	exit 0
else
	printf "Modification detected, mail send\n"
	echo "Crontab have changed" | mail -s "Crontab have changed" root
	sudo cat /etc/crontab > /etc/crontab_tmp
	exit 1
fi