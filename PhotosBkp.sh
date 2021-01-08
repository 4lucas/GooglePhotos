#!/bin/bash
#./adb.sh 
bg adb shell &
adb push "/home/infra/Dropbox/Camera Uploads/"* /sdcard/ExternalBackup
rm -rf "/home/infra/Dropbox/Camera Uploads/"*
