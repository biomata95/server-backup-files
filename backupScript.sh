#! /bin/bash

# Backup generated automatically at 10:00, 12:00, 14:00 and 20:00

function generateDate(){
	date=$(date +%F_%H-%M-%S)
	echo "$date"
}

function checkTime(){
	time=$(date +%H-%M-%S-%2N)
	echo "$time"
}

function generateBackup(){
	date=$(generateDate)
	file_log=/media/admin/Backup/logs/$date.log
	folder_backup=/media/admin/Backup/Backups/$date
	folder_origin=/home/user/Folder/*
	touch $file_log
	echo "Backup gerado as "$(date +%H:%M:%S) "do dia "$(date +%d-%m-%Y) >> $file_log
	ls -R /home/siga/Siga/* >> $file_log
	mkdir $folder_backup && cp -r $folder_origin $folder_backup
}

while [ True ]
do
	if [ "$(checkTime)" == "10-00-00-00" ] || [ "$(checkTime)" == "12-00-00-00" ] || [ "$(checkTime)" == "20-00-00-00" ]
	then
		generateBackup
	fi
done
