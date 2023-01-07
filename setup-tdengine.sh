
if [ "$TDENGINE_START" = "true" ]
then
    sudo systemctl start taosd
    until  curl -L -H "Authorization: Basic cm9vdDp0YW9zZGF0YQ=="   -d "SELECT SERVER_STATUS();"   $(hostname):6041/rest/sql; do sleep 1 &&  systemctl status taosd; done
fi