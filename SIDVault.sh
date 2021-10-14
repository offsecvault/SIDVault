#!/bin/bash
#
#
# this script is under construction for now
# created by: b0ydC
# contact: offsecvault@protonmail.com
#
#
clear
read -p "Press [Enter] key to continue..."
clear
echo -e "======================================"
echo -e "     O F F S E C V A U L T"
echo -e "          SIDVault"
echo -e "======================================\n\n"
echo -e "What to do ?\n\n"
echo -e "33. Collect Information\n"
echo -e "11. Print Banner\n"

echo -ne "Please choose one: "
read option
if (("$option" == "33")); then
        echo -ne "\nSet the collection name: "
        read name
        type="OFSV_"$name
        echo -e "\nFolder /home/FCI/$type was created\n\n"
elif (("$type" == "11")); then
        print "hola"
else
        echo -e "\n\n"
        exit 0;
fi
sudo mkdir /home/FCI/ $>/dev/null
sudo mkdir /home/FCI/$type $>/dev/null

# COPY FILES
echo -e "\ncopying files...\n"
echo -e "-----------------------------------\n."

#>>>>: passwd
sudo cp -r /etc/passwd /home/FCI/$type/ >/dev/null
#>>>>: hosts
sudo cp -r /etc/hosts /home/FCI/$type/ >/dev/null
#>>>>: crontab
sudo cp -r /etc/crontab /home/FCI/$type/ >/dev/null
#>>>>: sudoers
sudo cp -r /etc/sudoers /home/FCI/$type/ >/dev/null
#>>>>: shadow
sudo cp -r /etc/shadow /home/FCI/$type/ >/dev/null
#>>>>: resolv.conf
sudo cp -r /etc/resolv.conf /home/FCI/$type/ >/dev/null
#>>>>: profile
sudo cp -r /etc/profile /home/FCI/$type/ >/dev/null
#>>>>: logmessages
sudo cp -r /var/log/messages /home/FCI/$type/ >/dev/null

# RETRIEVE CONTENT AND COPY FILE
echo -e "\ngetting more info...\n"
echo -e "------------------------------------\n"

#>>>>: disk usage
sudo touch /home/FCI/$type/disk_usage.txt >/dev/null
df -h | sudo tee /home/FCI/$type/disk_usage.txt >/dev/null
#>>>>: os version
sudo touch /home/FCI/$type/os_version.txt >/dev/null
cat /etc/issue | sudo tee /home/FCI/$type/os_version.txt >/dev/null
#>>>>: ifconfig
sudo touch /home/FCI/$type/ifconfig.txt >/dev/null
ifconfig | sudo tee /home/FCI/$type/ifconfig.txt >/dev/null
#>>>>: sudo 
sudo touch /home/FCI/$type/sudo.txt >/dev/null 
sudo -l | sudo tee /home/FCI/$type/sudo.txt >/dev/null
#>>>>: whoami
sudo touch /home/FCI/$type/whoami.txt >/dev/null
whoami | sudo tee /home/FCI/$type/whoami.txt >/dev/null
#>>>>: uptime
sudo touch /home/FCI/$type/uptime.txt >/dev/null
uptime | sudo tee /home/FCI/$type/uptime.txt >/dev/null
#>>>>: route
sudo touch /home/FCI/$type/route.txt >/dev/null
route | sudo tee /home/FCI/$type/route.txt >/dev/null

# CREATING VAULT [compress]
echo -e "\ncreating vault on file /home/FCI/$type.tar.gz\n"
echo -e "--------------------------------------\n"
sudo tar -czf /home/FCI/$type.tar.gz /home/FCI/$type/ >/dev/null

# REMOVING CONTENT
echo -e "\nclearing tracks...\n"
echo -e "----------------------------\n"
sudo rm -rf /home/FCI/$type/ >/dev/null
