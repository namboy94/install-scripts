#!/bin/bash

#Edit fstab
echo "" | sudo tee -a /etc/fstab
echo "UUID=32CE48CB609D9515 /mnt/MEDIA ntfs defaults,nls=utf8,umask=000,uid=1000,windows_names 0 0" | sudo tee -a /etc/fstab
echo "UUID=08496C8004DD0937 /mnt/JAPANESEMEDIA ntfs defaults,nls=utf8,umask=000,uid=1000,windows_names 0 0" | sudo tee -a /etc/fstab
echo "UUID=09c899cd-1f96-4902-a98a-95cacff2fe12 /mnt/LINUXGAMES ext4 defaults,noatime 0 0" | sudo tee -a /etc/fstab
echo "UUID=3A7DA724212DCA94 /mnt/WINDOWSGAMES ntfs defaults,nls=utf8,umask=000,uid=1000,windows_names 0 0" | sudo tee -a /etc/fstab
echo "UUID=025B50FC450035A3 /mnt/OTHER ntfs defaults,nls=utf8,umask=000,uid=1000,windows_names 0 0" | sudo tee -a /etc/fstab

#Create rsync-backup script
echo '#!/bin/bash' >> $HOME/.bin/rsync-backup
echo "echo \"Starting Backup\"" >> $HOME/.bin/rsync-backup
echo "echo \"Other:\"" >> $HOME/.bin/rsync-backup
echo "rsync -av --delete-after '/mnt/OTHER/Other' hermann@192.168.1.2:/mnt/Main/Storage" >> $HOME/.bin/rsync-backup
echo "echo \"Media:\"" >> $HOME/.bin/rsync-backup
echo "rsync -av --delete-after '/mnt/MEDIA/Media' hermann@192.168.1.2:/mnt/Main/Storage" >> $HOME/.bin/rsync-backup
echo "echo \"Japanese Media:\"" >> $HOME/.bin/rsync-backup
echo "rsync -av --delete-after '/mnt/JAPANESEMEDIA/Japanese Media' hermann@192.168.1.2:/mnt/Main/Storage" >> $HOME/.bin/rsync-backup
echo "echo \"Windows Games:\"" >> $HOME/.bin/rsync-backup
echo "rsync -av --delete-after '/mnt/WINDOWSGAMES/Program Files' hermann@192.168.1.2:/mnt/Main/Storage/Games" >> $HOME/.bin/rsync-backup
echo "echo \"Linux Games:\"" >> $HOME/.bin/rsync-backup
echo "rsync -av --delete-after '/mnt/LINUXGAMES/steam' hermann@192.168.1.2:/mnt/Main/Storage/Games" >> $HOME/.bin/rsync-backup
echo "echo \"Home:\"" >> $HOME/.bin/rsync-backup
echo "rsync -av --delete-after '/home/hermann/' hermann@192.168.1.2:/mnt/Main/Backups/Home/HK-03" >> $HOME/.bin/rsync-backup
echo "echo \"\n\n Backup to Remote Complete, Backing Up Programming Projects to Local:\"" >> $HOME/.bin/rsync-backup
echo "rsync -av --delete-after hermann@192.168.1.2:/mnt/Main/Programming/ /mnt/OTHER/Programming" >> $HOME/.bin/rsync-backup
sudo chmod 755 $HOME/.bin/rsync-backup
