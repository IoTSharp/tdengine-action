cd /tmp
if [ "$TDENGINE_VERSION" = "latest" ];
then
  export TDENGINE_VERSION=$(curl --silent "https://api.github.com/repos/taosdata/TDengine/releases" | jq -r '. | sort_by(.tag_name) | reverse[] | .tag_name' | sed -e 's/v//g' | head -n 1)
  export TDENGINE_DOWNLOAD_PATH="https://www.taosdata.com/assets-download/3.0/"
else
  export TDENGINE_DOWNLOAD_PATH="https://www.taosdata.com/assets-download/3.0/"
fi
echo $TDENGINE_VERSION
echo $TDENGINE_DOWNLOAD_PATH
curl -o TDengine-server.tar.gz $TDENGINE_DOWNLOAD_PATHT/TDengine-server-$TDENGINE_VERSION-Linux-x64.tar.gz  
tar xvfz TDengine-server.tar.gz
rm -r TDengine-server.tar.gz
cd  TDengine-server
sudo ./install.sh

curl -o TDengine-client.tar.gz $TDENGINE_DOWNLOAD_PATHT/TDengine-client-$TDENGINE_VERSION-Linux-x64.tar.gz 
tar  -xvf TDengine-client.tar.gz 
rm TDengine-client.tar.gz -f 
cd  $(ls TDengine-client*  -d)
./install_client.sh

cd -
