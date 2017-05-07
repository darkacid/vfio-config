#!/bin/bash



HOST_IP=192.168.1.150
HOST_BROADCAST=255.255.255.0
HOST_NETMASK=192.168.1.255
HOST_GATEWAY=192.168.1.1


# Prints "good" if foundif.sh doesn't find tap0 interface
# otherwise, deletes the tap0 interface

RESULT=$(./foundif.sh)
if [ $RESULT = "no" ]; then
echo "good"
else
tunctl -d tap0
fi


ifconfig enp3s0 0.0.0.0 down
ifconfig br0 down

brctl delbr br0

ifconfig enp3s0 up

ifconfig enp3s0 $HOST_IP netmask $HOST_NETMASK broadcast $HOST_BROADCAST
route add default gw $HOST_GATEWAY

systemctl start NetworkManager
