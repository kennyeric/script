#/usr/bin/sh
KILL_COMMAND="kill -HUP `ps -ef | grep uwsgi | awk '(/9989/){print $2}'`"

echo "kill 9989 uwsgi process..."
${KILL_COMMAND}

if [ "$?" == "0" ]
then
    echo "The kill command executes successfully"
else
    echo "The kill command executes failed"
fi

logfile=`date +"%Y-%m-%d.log"`
logdir="/home/xc/env/python/"

STARTUP_COMMAND="uwsgi -s :9989 --ini-paste production.ini -d $logdir$logfile"

echo "The start command is ..."
echo "$STARTUP_COMMAND"

${STARTUP_COMMAND}

if [ "$?" == "0" ]
then
    echo "The startup command executes successfully" >> $logdir$logfile
else
    echo "The startup ommand executes failed" >> $logdir$logfile
    exit 1
fi
