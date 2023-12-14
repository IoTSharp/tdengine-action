cd /tmp
if [ "$TDENGINE_VERSION" = "latest" ];
then
  export TDENGINE_VERSION=$(curl -s "https://api.github.com/repos/taosdata/TDengine/releases" | jq -r '. | sort_by(.tag_name) | reverse[] | .tag_name' | sed -e 's/ver-//g' | head -n 1)
  export TDENGINE_DOWNLOAD_PATH="https://www.taosdata.com/assets-download/3.0"
else
  export TDENGINE_DOWNLOAD_PATH="https://www.taosdata.com/assets-download/3.0"
fi
echo $TDENGINE_VERSION
echo $TDENGINE_DOWNLOAD_PATH
curl  -s -o TDengine-server.tar.gz $TDENGINE_DOWNLOAD_PATH/TDengine-server-$TDENGINE_VERSION-Linux-x64.tar.gz  
tar xvfz TDengine-server.tar.gz
rm -r TDengine-server.tar.gz
cd  $(ls TDengine-server*  -d)
sudo ./install.sh -h
sudo ./install.sh -e no

cd -
