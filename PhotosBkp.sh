#!/bin/bash
bg adb shell &
#Photos and videos from Dropbox
adb push "/home/user/Dropbox/Camera Uploads/"* /sdcard/ExternalBackup

#Photos and videos from the other device
adb push "/media/user/NIKON/DCIM/100NIKON/"* /sdcard/ExternalBackup

while true; do
    read -p "Do you wish delete local archives?" yn
    case $yn in
        [Yy]* ) rm -rf "/home/infra/Dropbox/Camera Uploads/"*; rm -rf "/media/infra/NIKON/DCIM/100NIKON/"*; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
