#!/bin/sh

cd `dirname $0`/..
. conf/config.sh

LOG_FN=./logs/sync-log-`date +%Y%m%d`.txt

if [ -x $GROWLNOTIFY ]; then
    $GROWLNOTIFY -m'kicker starting' $GROWLTITLE 
fi; 

$KICKER --no-growl -e ./bin/sync.sh docs/$SRC_PATH >>$LOG_FN 2>&1
