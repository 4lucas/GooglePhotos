#!/bin/bash

#Download Dropbox content
#Powered by Dropbox-Uploader
#https://github.com/iLucasBernardes/Dropbox-Uploader
#forked from andreafabrizi/Dropbox-Uploader
"/home/infra/Área de Trabalho/Google Photos/Dropbox-Uploader/"./dropbox_uploader.sh download "/Camera Uploads" "/home/infra/Dropbox/"

bg adb shell &
#Photos and videos from Dropbox
adb push "/home/infra/Dropbox/Camera Uploads/"* /sdcard/ExternalBackup

#Photos and videos from the other device
adb push "/media/infra/NIKON/DCIM/100NIKON/"* /sdcard/ExternalBackup

#Exclude local and Dropbox archives
while true; do
    read -p "Do you wish delete local and online archives?" yn
    case $yn in
        [Yy]* ) rm -rf "/home/infra/Dropbox/Camera Uploads/"*; rm -rf "/media/infra/NIKON/DCIM/100NIKON/"*; "/home/infra/Área de Trabalho/Google Photos/Dropbox-Uploader/"./dropbox_uploader.sh delete "/Camera Uploads"; "/home/infra/Área de Trabalho/Google Photos/Dropbox-Uploader/"./dropbox_uploader.sh mkdir "/Camera Uploads";  break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
