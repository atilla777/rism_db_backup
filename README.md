# rism_db_backup
Script for backup  RISM application potsgresql database, and remove old backups.

### How to use
Copy script on server (for example to /home/rism) and make them executable:
```bash
chmod u+x rism_db_backup.sh
```
Edit end config rism_db_backup.sh:
```bash
vi rism_db_backup.sh:
```
Configure cron (backup will be done under rism user account):
```bash
sudo crontab -u rism -e
```
Insert line in crontab config (customize crontab start time as you like):
```
0 3 * * * /path/to/script/rism_db_backup.sh > /dev/null 2>&1
```
In postgresql pg_hba.conf file should be present something like this line:
```
local    replication     rism                       md5
```
After place this line postgresql should be restarted:
```bash
sudo systemctl restart postgresql
```
