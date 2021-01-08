#!/bin/bash
bg adb shell &
adb push "/home/user/Dropbox/Camera Uploads/"* /sdcard/ExternalBackup
rm -rf "/home/user/Dropbox/Camera Uploads/"*
