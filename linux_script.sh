#!/bin/bash
# A script to perform all of the basic tasks
terminal = `tty`
# Back up important files
mkdir -p ~/Backups/log
cp /etc/group ~/Backups
cp /etc/passwd ~/Backups
cp /etc/shadow ~/Backups
cp -r /var/log/* ~/Backups/log
cp -r /etc/ssh ~/Backups/ssh
#cp **Path to cyberpatriot directory** ~/Backups
crontab -l > ~/Backups/crontab-backup


# Correct Permissions
chmod -R 444 /var/log
chmod 440 /etc/passwd
chmod 440 /etc/shadow
chmod 440 /etc/group
chmod -R 444 /etc/ssh


# Perform updates
apt-get update -qq
apt-get upgrade -qq
apt-get dist-upgrade -qq


# User Management
exec < users.txt
while read line
do 
	if [ `echo line | cut -c1-2` == "[A" ]
	then
		echo `echo line | cut -d" " -f 2` + "made administrator"
	elif [ `echo line | cut -c1-2` == "[S" ]
	then
		echo `echo line | cut -d" " -f 2` + "made standard"
	elif [ `echo line | cut -c1-2` == "[D" ]
	then
		echo `echo line | cut -d" " -f 2` + "deleted"
	elif [ `echo line | cut -c1-2` == "[P" ]
	then
		echo "Enter new password"
		exec < $terminal
		read newpass
		
		echo `echo line | cut -d" " -f 2` + "'s password changed to: " $newpass
		exec < users.txt
	fi
done


# Remove Media Files
find / -name "*.midi" -type f -delete
find / -name "*.mid" -type f -delete
find / -name "*.mod" -type f -delete
find / -name "*.mp3" -type f -delete
find / -name "*.mp2" -type f -delete
find / -name "*.mpa" -type f -delete
find / -name "*.abs" -type f -delete
find / -name "*.mpega" -type f -delete
find / -name "*.au" -type f -delete
find / -name "*.snd" -type f -delete
find / -name "*.wav" -type f -delete
find / -name "*.aiff" -type f -delete
find / -name "*.aif" -type f -delete
find / -name "*.sid" -type f -delete
find / -name "*.flac" -type f -delete
find / -name "*.ogg" -type f -delete
clear
find / -name "*.mpeg" -type f -delete
find / -name "*.mpg" -type f -delete
find / -name "*.mpe" -type f -delete
find / -name "*.dl" -type f -delete
find / -name "*.movie" -type f -delete
find / -name "*.movi" -type f -delete
find / -name "*.mv" -type f -delete
find / -name "*.iff" -type f -delete
find / -name "*.anim5" -type f -delete
find / -name "*.anim3" -type f -delete
find / -name "*.anim7" -type f -delete
find / -name "*.avi" -type f -delete
find / -name "*.vfw" -type f -delete
find / -name "*.avx" -type f -delete
find / -name "*.fli" -type f -delete
find / -name "*.flc" -type f -delete
find / -name "*.mov" -type f -delete
find / -name "*.qt" -type f -delete
find / -name "*.spl" -type f -delete
find / -name "*.swf" -type f -delete
find / -name "*.dcr" -type f -delete
find / -name "*.dir" -type f -delete
find / -name "*.dxr" -type f -delete
find / -name "*.rpm" -type f -delete
find / -name "*.rm" -type f -delete
find / -name "*.smi" -type f -delete
find / -name "*.ra" -type f -delete
find / -name "*.ram" -type f -delete
find / -name "*.rv" -type f -delete
find / -name "*.wmv" -type f -delete
find / -name "*.asf" -type f -delete
find / -name "*.asx" -type f -delete
find / -name "*.wma" -type f -delete
find / -name "*.wax" -type f -delete
find / -name "*.wmv" -type f -delete
find / -name "*.wmx" -type f -delete
find / -name "*.3gp" -type f -delete
find / -name "*.mov" -type f -delete
find / -name "*.mp4" -type f -delete
find / -name "*.avi" -type f -delete
find / -name "*.swf" -type f -delete
find / -name "*.flv" -type f -delete
find / -name "*.m4v" -type f -delete
clear
find /home -name "*.tiff" -type f -delete
find /home -name "*.tif" -type f -delete
find /home -name "*.rs" -type f -delete
find /home -name "*.im1" -type f -delete
find /home -name "*.gif" -type f -delete
find /home -name "*.jpeg" -type f -delete
find /home -name "*.jpg" -type f -delete
find /home -name "*.jpe" -type f -delete
find /home -name "*.png" -type f -delete
find /home -name "*.rgb" -type f -delete
find /home -name "*.xwd" -type f -delete
find /home -name "*.xpm" -type f -delete
find /home -name "*.ppm" -type f -delete
find /home -name "*.pbm" -type f -delete
find /home -name "*.pgm" -type f -delete
find /home -name "*.pcx" -type f -delete
find /home -name "*.ico" -type f -delete
find /home -name "*.svg" -type f -delete
find /home -name "*.svgz" -type f -delete
clear


# Remove Backdoors and Hacking Tools



# Clean Up
apt-get autoremove -y -qq
apt-get autoclean -y -qq
apt-get clean -y -qq
