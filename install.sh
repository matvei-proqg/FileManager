#!/bin/bash

if [ "$(id -u)" -ne 0 ]; then 
    sudo bash ./install.sh
    exit 1
fi

SCRIPT_LOCATION=$(cd -- "$( dirname -- "./$BASH_SOURCE[0]" )" &> /dev/null && pwd)

chmod a+x "$SCRIPT_LOCATION/Files"

FILE="/home/$SUDO_USER/Desktop/auruos-file-manager.desktop"
if [ -f $FILE ]; then
    rm $FILE
    sudo -u $SUDO_USER touch $FILE
else 
    sudo -u $SUDO_USER touch $FILE
fi

printf "
[Desktop Entry]
Name=File Manager
Comment=Auru OS File Manager
Exec=$SCRIPT_LOCATION/Files
Icon=$SCRIPT_LOCATION/FileManager.png
Terminal=false
Type=Application
Categories=Utility;
" >> $FILE

chmod a+x $FILE


APPFILE="/usr/share/applications/auruos-file-manager.desktop"
if [ -f $APPFILE ]; then
    rm $APPFILE
    touch $APPFILE
else 
    touch $APPFILE
fi


printf "
[Desktop Entry]
Name=File Manager
Comment=Auru OS File Manager
Exec=$SCRIPT_LOCATION/Files
Icon=$SCRIPT_LOCATION/FileManager.png
Terminal=false
Type=Application
Categories=Utility;
" >> $APPFILE
