serverUrl='http://127.0.0.1:4444'
serverFile=selenium-server-standalone-2.50.1.jar

phpVersion=`php -v`

composer install

echo "check firefox version"
firefox --version

echo "Starting xvfb"
echo "Starting Selenium"
if [ ! -f $serverFile ]; then
    wget http://selenium-release.storage.googleapis.com/2.5asdf/$serverFile
fi

export DISPLAY=:99.0

## You can start the selenium in two ways. The second method prints all selenium 
## server logs in travis. This might give long logs errors. Therefore the first 
## method is preferred. The second one might be convenient when debugging.
# 1:
sudo xvfb-run java -jar $serverFile > /tmp/selenium.log &

# 2:
#sh -e /etc/init.d/xvfb start
#sleep 3
#sudo java -jar $serverFile -port 4444 > /tmp/selenium.log &

sleep 3

wget --retry-connrefused --tries=60 --waitretry=1 --output-file=/dev/null $serverUrl/wd/hub/status -O /dev/null
if [ ! $? -eq 0 ]; then
    echo "Selenium Server not started"
    exit 1
else
    echo "Finished setup"
fi
