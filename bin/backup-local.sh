echo "Log for `date`" > /tmp/backup.log
rsync -rtDz --del --bwlimit=200 --size-only '/media/zeta/TV\ Shows/' /media/dean/elements/TV\ Shows/ >> /tmp/backup.log
rsync -rtDz --del --bwlimit=200 --size-only '/media/zeta/Movies/' /media/dean/elements/Movies        >> /tmp/backup.log
rsync -rtDz --del --bwlimit=200 --size-only '/media/zeta/Saves/' /media/dean/elements/Saves          >> /tmp/backup.log
rsync -rtDz --del --bwlimit=200 --size-only '/media/zeta/Programs/' /media/dean/elements/Programs    >> /tmp/backup.log
rsync -rtDz       --bwlimit=200             '/media/zeta/Backups/' /media/dean/elements/Backups                  >> /tmp/backup.log
rsync -rtDz --del --bwlimit=200             '/media/zeta/Pictures/' /media/dean/elements/Pictures                >> /tmp/backup.log
rsync -rtDz --del --bwlimit=200             '/media/zeta/My\ MP3s/' /media/dean/elements/My\ MP3s/               >> /tmp/backup.log
rsync -rtDz --del --bwlimit=200             '/media/zeta/Roms/' /media/dean/elements/Roms                        >> /tmp/backup.log
echo "Subject: Backup Report for `date`

`cat /tmp/backup.log`" | msmtp dean.marano@gmail.com
