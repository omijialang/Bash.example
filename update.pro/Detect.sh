#!/bin/sh

. /haha/functions

# Is there have an package for update at $UP_ROOT named $PACKAGE_NAME
UPDATE_CONF="/haha/update.conf"
UPDATE_RESULT="/haha/update.result"
UPDATE_LOG="/haha/update.log"

# You may comment two lines below when DEBUG
exec 1>$UPDATE_RESULT
exec 2>$UPDATE_LOG

# Make a suited env. Maybe the console only support ASCII
export LC_ALL="C"

if [ -f $UPDATE_CONF ]; then
	
	FILE_INFO=`cat $UPDATE_CONF`
	UPDATE_FILE=${FILE_INFO##PATH=}

	if [ -f $UPDATE_FILE ]; then
		sh $UPDATE_FILE || { echo "Error !"; Err_Handle $0 $LINENO; }
	else
		echo "No Update Package !"
		exit 0	
	fi
fi
mv $UPDATE_FILE ${UPDATE_FILE}_backup
echo "Success !"
