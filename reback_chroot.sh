choice1=`more tempfile`
echo "grub-install $choice1"
grub-install $choice1
uuid=`blkid | egrep "${choice1}1" | awk -F \" '{print $2}'`
echo $uuid
sed -i "s/[a-z0-9]\{8\}-[a-z0-9]\{4\}-[a-z0-9]\{4\}-[a-z0-9]\{4\}-[a-z0-9]\{12\}/${uuid}/g" /boot/grub/grub.cfg
sed -i "s/[a-z0-9]\{8\}-[a-z0-9]\{4\}-[a-z0-9]\{4\}-[a-z0-9]\{4\}-[a-z0-9]\{12\}/${uuid}/g" /etc/fstab
echo "exit chroot"
sleep 3s
