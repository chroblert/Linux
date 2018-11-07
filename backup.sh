#!/bin/sh
#author:Jerrybird

mkdir /baksys #create a directory for storing .tar.gz file and other partion file and so on
mkdir /baksys/fullbackup
rm -r /baksys/fullbackup/*
tar -czpvf /baksys/fullbackup/backup_1_img.tar.gz  /  --exclude=/baksys --exclude=/lost+found --exclude=/proc/* --exclude=/sys/* --exclude=/tmp/* --exclude=/dev/* --exclude=/media/* --exclude=/mnt/*  2>>/baksys/tar1.errors.log 
fdisk -l >/baksys/partion.txt
