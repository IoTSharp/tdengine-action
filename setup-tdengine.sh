
if [ "$TDENGINE_START" = "true" ]
then
    sudo chmod  777 /etc/taos/taos.cfg
    sudo echo "supportVnodes             256"  >>  /etc/taos/taos.cfg
    sudo systemctl start taosd
    sudo systemctl start taosadapter
    sudo systemctl start taosx
    sudo systemctl start taos-explorer
    export TDENGINE_REST=$(hostname):6041/rest/sql
    count=0
    until  curl -L -H "Authorization: Basic cm9vdDp0YW9zZGF0YQ=="   -d "SELECT SERVER_STATUS();"  $TDENGINE_REST ; do 
        sleep 1 ;
        let count+=1; 
        if [ "$count" -lt 20 ]; then exit -1 ; fi
    done
fi
