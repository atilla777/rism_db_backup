# rism_db_backup
Backup scripts for RISM application potsgresql database

Copy script on server (for example to /home/rism) and make them executable:
```bash
chmod u+x rism_db_backup.sh
```
Configure cron (backup will be done under rism user account):
```bash
sudo crontab -u rism -e
```
Insert line in crontab config:
```
15 3 * * * /path/to/script/rism_db_backup.sh > /dev/null 2>&1
```
In postgresql pg_hba.conf file shoul be present something line this line:
```
host    replication     rism             127.0.0.1/32            md5
```
After place this line postgresql should be restarted:
```bash
sudo systemctl restart postgresql
```
