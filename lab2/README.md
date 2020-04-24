docker run --name blue01 --net host --privileged -it --entrypoint bash node:7
apt update
apt install bluetooth bluez libbluetooth-dev libudev-dev
npm install -g btlejuice
service bluetooth start
hciconfig hci0 up
btlejuice-proxy
