
if [ "$TDENGINE_START" = "true" ]
then
    sudo systemctl start taosd
    sudo systemctl start taosadapter 
    export TDENGINE_REST=$(hostname):6041/rest/sql
    until  curl -L -H "Authorization: Basic cm9vdDp0YW9zZGF0YQ=="   -d "SELECT SERVER_STATUS();"  $TDENGINE_REST ; do sleep 1 &&  systemctl status taosd; done
fi