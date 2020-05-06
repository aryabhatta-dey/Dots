#!/usr/bin/env bash

echo "Updating packages"
yay -Syu --devel

echo "Updating local backup"
rm -rf ~/Documents/'Bibles of my life'/'My setup'/home_backup_old
mv  ~/Documents/'Bibles of my life'/'My setup'/home_backup ~/Documents/'Bibles of my life'/'My setup'/home_backup_old
mkdir ~/Documents/'Bibles of my life'/'My setup'/home_backup
cp -r ~/.config ~/Documents/'Bibles of my life'/'My setup'/home_backup
cp -r ~/.npm ~/Documents/'Bibles of my life'/'My setup'/home_backup
cp -r ~/.vim  ~/Documents/'Bibles of my life'/'My setup'/home_backup
cp ~/.zcompdump  ~/Documents/'Bibles of my life'/'My setup'/home_backup
cp ~/.vimrc ~/Documents/'Bibles of my life'/'My setup'/home_backup
cp ~/.zprofile ~/Documents/'Bibles of my life'/'My setup'/home_backup
cp ~/.zshenv ~/Documents/'Bibles of my life'/'My setup'/home_backup
cp ~/.zshrc.zni ~/Documents/'Bibles of my life'/'My setup'/home_backup
cp ~/.zshrc ~/Documents/'Bibles of my life'/'My setup'/home_backup

uuid=f411211d-1692-4c4c-85aa-787c13768a2e
lsblk -f | grep -wq $uuid || exit
echo "Updating external hdd backup" 
sudo mount /dev/sdc1 /mnt/usbstick
rsync --delete -a ~/Documents/ /mnt/usbstick/Documents
rsync --delete -a ~/Music/ /mnt/usbstick/Music
sudo umount /dev/sdc1
