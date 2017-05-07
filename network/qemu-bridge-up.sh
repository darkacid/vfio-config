#!/bin/bash



HOST_IP=192.168.1.150
HOST_BROADCAST=255.255.255.0
HOST_NETMASK=192.168.1.255
HOST_GATEWAY=192.168.1.1


# Prints "good" if foundif.sh finds a tap0 interface
# otherwise, adds a tap0 interface

RESULT=$(./foundif.sh)
if [ $RESULT = "yes" ]; then
echo "good"
else
tunctl -u sergey
fi


systemctl stop NetworkManager
ifconfig enp3s0 0.0.0.0 down
ifconfig tap0	0.0.0.0 down

brctl addbr br0
brctl addif br0 enp3s0
brctl addif br0 tap0

brctl stp br0 off

ifconfig enp3s0 up
ifconfig tap0	up

ifconfig br0 $HOST_IP netmask $HOST_NETMASK broadcast $HOST_BROADCAST
route add default gw $HOST_GATEWAY


