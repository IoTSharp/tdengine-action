
if [ "$TDENGINE_START" = "true" ]
then
    systemctl start taosd
    until  curl -L -H "Authorization: Basic cm9vdDp0YW9zZGF0YQ=="   -d "SELECT SERVER_STATUS();"   localhost:6041/rest/sql; do sleep 1; done
fi