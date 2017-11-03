echo "Log for `date`" > /tmp/backup.log
rsync -rtDz -e "ssh -p 5720" --del --bwlimit=200 'dean@fusion.deanoftech.com:/mnt/eta/TV\ Shows/' /mnt/eta/TV\ Shows/ >> /tmp/backup.log
rsync -rtDz -e "ssh -p 5720" --del --bwlimit=200 'dean@fusion.deanoftech.com:/mnt/eta/Movies/' /mnt/eta/Movies        >> /tmp/backup.log
rsync -rtDz -e "ssh -p 5720" --del --bwlimit=200 'dean@fusion.deanoftech.com:/mnt/eta/Saves/' /mnt/eta/Saves          >> /tmp/backup.log
rsync -rtDz -e "ssh -p 5720" --del --bwlimit=200 'dean@fusion.deanoftech.com:/mnt/eta/Programs/' /mnt/eta/Programs    >> /tmp/backup.log
rsync -rtDz -e "ssh -p 5720"       --bwlimit=200 'dean@fusion.deanoftech.com:/mnt/eta/Backups/' /mnt/eta/Backups      >> /tmp/backup.log
rsync -rtDz -e "ssh -p 5720" --del --bwlimit=200 'dean@fusion.deanoftech.com:/mnt/eta/Pictures/' /mnt/eta/Pictures    >> /tmp/backup.log
rsync -rtDz -e "ssh -p 5720" --del --bwlimit=200 'dean@fusion.deanoftech.com:/mnt/eta/My\ MP3s/' /mnt/eta/My\ MP3s/   >> /tmp/backup.log
rsync -rtDz -e "ssh -p 5720" --del --bwlimit=200 'dean@fusion.deanoftech.com:/mnt/eta/Roms/' /mnt/eta/Roms            >> /tmp/backup.log
echo "Subject: Backup Report for `date`

`cat /tmp/backup.log`" | msmtp dean.marano@gmail.com

