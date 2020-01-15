#!/bin/bash
# Script to backup all RISM postgresql databases

# Set postgresql user login and password
PGUSER="rism"
PGPASSWORD="password"
export PGUSER PGPASSWORD

# Set location to place backups
backup_dir="/home/username/backup/"

# Set numbers of days you want to keep copie of your databases
number_of_days=15

# String to append to the name of the backup files
backup_date=`date +%d-%m-%Y`

# Create backup
pg_basebackup -w -D $backup_dir/$backup_date -Ft -z -Xs

# Delete backups older than 15 days
find $backup_dir -type d -prune -mtime +$number_of_days -exec rm -f {} \;

# Secure (forget) password
PGUSER=""
PGPASSWORD=""
export PGUSER PGPASSWORD
