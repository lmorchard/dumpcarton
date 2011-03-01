#!/bin/sh

cd `dirname $0`/..
. conf/config.sh

LOG_FN=./logs/sync-log-`date +%Y%m%d`.txt

if [ -x $RSYNC ]; then
    if [ -x $GROWLNOTIFY ]; then
        $GROWLNOTIFY -m'Starting rsync...' $GROWLTITLE 
    fi; 
    echo 'Running rsync @ '`date`':' >>$LOG_FN
    $RSYNC -vartz --del $RSYNC_SRC $RSYNC_DEST >>$LOG_FN 2>&1;
    echo '----------------------------------------------------------------------' >>$LOG_FN
fi;
if [ -x $S3SYNC ]; then
    if [ -x $GROWLNOTIFY ]; then
        $GROWLNOTIFY -m'Starting s3sync...' $GROWLTITLE 
    fi; 
    echo 'Running S3SYNC @ '`date`':' >>$LOG_FN
    $S3SYNC -pvrs --delete $S3SYNC_SRC $S3SYNC_DEST >>$LOG_FN 2>&1;
    echo '----------------------------------------------------------------------' >>$LOG_FN
fi;
if [ -x $GROWLNOTIFY ]; then
    $GROWLNOTIFY -m'Done.' $GROWLTITLE 
fi; 
