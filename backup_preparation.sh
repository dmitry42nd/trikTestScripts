#!/bin/sh

old_ssh="/etc/ssh"
new_ssh="/etc/dropbear/"
trikrc="/etc/trik/trikrc"
hostname="/etc/trik/custom/hostname"
wpa_supplicant="/etc/wpa_supplicant.conf"

if [ -d $old_ssh ]
then
	rm $old_ssh/ssh_host_*
fi

if [ -d $new_ssh ]
then
	rm $new_ssh/*
fi

if [ -e $trikrc ]
then
	rm $trikrc
fi

if [ -e $hostname ]
then
	rm $hostname
fi

if [ -e $wpa_supplicant ]
then
	rm $wpa_supplicant
	echo "ctrl_interface=/var/run/wpa_supplicant" >> $wpa_supplicant
	echo "ctrl_interface_group=0" >> $wpa_supplicant
	echo "update_config=1" >> $wpa_supplicant
fi

rm backup_preparation.sh

#sync

#halt