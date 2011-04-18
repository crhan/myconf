#!/bin/bash

# cur_dir="/home/xf/git/conf/tb.gentoo"

if [ $(id -u) != "0" ]; then
    echo "Error: You must be root to run this script, please use root to update"
    exit 1
fi

# cd $cur_dir

/usr/sbin/lspci >lspci
/sbin/fdisk -l >fdisk_-l
/bin/grep -v '^#' /etc/fstab | /bin/grep -v '^$' > fstab
cp -u /usr/src/linux/.config kernel.config
cp -u /etc/locale.gen ./
cp -u /opt/kvm/ooo ./
cp -u /etc/make.conf ./
cp -u /etc/portage/package.* ./portage/
cp -u /etc/conf.d/local.start ./conf.d/
cp -u /etc/conf.d/net ./conf.d/
cp -u /etc/X11/xorg.conf ./X11/

#chown xf.xf -R $cur_dir
