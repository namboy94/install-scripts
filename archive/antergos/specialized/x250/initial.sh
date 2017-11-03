#!/bin/bash

#Create rsync-backup script
echo '#!/bin/bash' >> $HOME/.bin/rsync-backup
echo "echo \"Home:\"" >> $HOME/.bin/rsync-backup
echo "rsync -av --delete-after '/home/hermann/' hermann@192.168.1.2:/mnt/Main/Backups/Home/x250" >> $HOME/.bin/rsync-backup
sudo chmod 755 $HOME/.bin/rsync-backup
