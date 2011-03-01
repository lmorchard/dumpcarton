#!/bin/sh

# Switch to the project directory, load config
cd `dirname $0`/..
. conf/config.sh
CWD=`pwd`

if [ ! -d $HOME/Library/LaunchAgents ]; then
    mkdir -p $HOME/Library/LaunchAgents;
fi

PLIST_FN=$HOME/Library/LaunchAgents/$LAUNCHD_LABEL.plist
echo "Installing $PLIST_FN"

cat > $PLIST_FN <<PLIST
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>Disabled</key> 
    <false/>
    <key>Label</key> 
    <string>$LAUNCHD_LABEL</string>
    <key>ProgramArguments</key>
    <array>
        <string>$CWD/bin/kicker.sh</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>KeepAlive</key>
    <true/>
</dict>
</plist>
PLIST

# HACK: Will gripe on first install, but who cares?
launchctl unload $PLIST_FN >/dev/null 2>&1
launchctl load -w $PLIST_FN
