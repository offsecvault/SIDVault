!#/bin/bash
#
#
# this script is under construction for now
# created by: b0ydC
# contact: offsecvault@protonmail.com
#
#
if ["$2" == ""]
then
echo "usage: ./DiscoverNet.sh 192.168.1"
else
for ip in `seq 2 254`; do
	ping -c 2 $1.$ip | grep "64 bytes" | cut -d " " -f 4 | tr -d ":" &
done
fi
