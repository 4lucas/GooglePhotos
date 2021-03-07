#!/bin/bash

#Download Dropbox content
#Powered by Dropbox-Uploader
#https://github.com/iLucasBernardes/Dropbox-Uploader
#forked from andreafabrizi/Dropbox-Uploader
#
#Comment the next line if you don't use Dropbox download using "Dropbox-Uploader" (API)
"/home/user/Área de Trabalho/Google Photos/Dropbox-Uploader/"./dropbox_uploader.sh download "/Camera Uploads" "/home/user/Dropbox/"

bg adb shell &
#Photos and videos from Dropbox
adb push "/home/user/Dropbox/Camera Uploads/"* /sdcard/ExternalBackup

#Photos and videos from the other device
adb push "/media/user/NIKON/DCIM/100NIKON/"* /sdcard/ExternalBackup

#Exclude local and Dropbox archives
while true; do
    read -p "Do you wish delete local and online archives?" yn
    case $yn in
        [Yy]* ) rm -rf "/home/user/Dropbox/Camera Uploads/"*; rm -rf "/media/user/NIKON/DCIM/100NIKON/"*; "/home/user/Área de Trabalho/Google Photos/Dropbox-Uploader/"./dropbox_uploader.sh delete "/Camera Uploads"; "/home/user/Área de Trabalho/Google Photos/Dropbox-Uploader/"./dropbox_uploader.sh mkdir "/Camera Uploads";  break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
