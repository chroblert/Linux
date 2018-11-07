#!/bin/sh
#author:Jerrybird

fdisk -l 2> /dev/null | egrep "^Disk /dev/[s,h]d[[:alpha:]]" | awk -F: '{print $1,$2}'
#sleep 5s
read -p "Please input the device path that you want to set:" choice1

until  fdisk -l 2> /dev/null | egrep "^Disk /dev/[s,h]d[[:alpha:]]" | awk -F: '{print $1}'  | egrep "^Disk /dev/${choice1}$" 2>/dev/null 
do
	if [ ${choice1} = "quit" ] ;then  echo "Quiting..."  ; exit 8 ;fi
	read -p "Please input the device path again that you want to set:" choice1
done
choice1="/dev/"${choice1}
echo "${choice1}"
echo "EUC"
read -p  "Your choice is $choice1, Partition will damamge the data, Please confirm(y|n):" choice2
until [ $choice2 = "y"  -o $choice2 = "Y" -o $choice2 = "n" -o $choice2 = "N" ]
do
	read -p  "Your choice is $choice2 ,Partition will damamge the data, Please confirm(y|n):" choice2
done	
if [ $choice2 = "N" -o $choice2 = "n" ]
then
	echo "Quiting.." 
	exit 9
else	
	df | grep $choice1 2> /dev/null  && echo "$choice1 are using. Please umount it  first." && exit 9
	echo "erasing the partition data....."	
	dd if=/dev/zero of=$choice1 bs=512 count=1 &> /dev/null
	sync &&	sleep 3
	partprobe $choice1
	echo "Creating new partition..."
echo 'd

d

d

n
p
1

+19G
n
e
2


n


t
5
82
a
1
w' | fdisk $choice1 2> /dev/null
	sync && sleep 3
	partprobe $choice1
	echo "creating filesystem..."
	mkfs.ext4 ${choice1}1 2> /dev/null
	mkswap ${choice1}5 2> /dev/null
	# mkdir -p /data/test1 /data/test2
	# df  | grep ${choice1}1 &> /dev/null && umount ${choice1}1  
	# df  | grep ${choice1}2 &> /dev/null && umount ${choice1}2 
	# mount ${choice1}1 /data/test1
	# mount ${choice1}2 /data/test2
	swapon ${choice1}5  2> /dev/null
	echo "SUC"
fi 
echo "partioning the disk over,geshihua over..."
echo "mount to /mnt"
sleep 10s
mount ${choice1}1 /mnt 
tar -xzpvf /home/jerrybird/backup_img/fullbackup/backup_1_img.tar.gz -C /mnt 
mount --bind /dev /mnt/dev 
mount --bind /proc /mnt/proc 
mount --bind /sys /mnt/sys 
echo "mount over"
cp /home/jerrybird/backup_img/fullbackup/reback_chroot.sh /mnt/
echo $choice1 > tempfile
cp ./tempfile /mnt
sleep 2s
echo "chroot"
chroot /mnt /bin/bash -c "/bin/sh reback_chroot.sh"
echo "exited chroot"
echo "umount"
umount /mnt/dev /mnt/proc /mnt/sys /mnt
echo "======================Done======================="
echo "||           Successful congratulations!       ||"
echo "=================================================" 
