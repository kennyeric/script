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

#`cd $HOME/env/python/`
if [ "$?" == "0" ]
then
    echo "app path does exist"
else
    exit 1
fi

logfile=`date +"%Y-%m-%d-%H-%M.log"`
homedir="$HOME/env/python/"
appConfig="production.ini"

STARTUP_COMMAND="uwsgi -s :9989 --ini-paste $appConfig -d $logfile"

echo "The start command is ..."
echo "$STARTUP_COMMAND"

${STARTUP_COMMAND}

if [ "$?" == "0" ]
then
    echo "The startup command executes successfully"
else
    echo "The startup ommand executes failed"
    exit 1
fi
