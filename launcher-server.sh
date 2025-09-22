#!/bin/bash
#--------------------------#
MAX_MEMORY="6192"
MIN_MEMORY="6192"
Link_Server="https://piston-data.mojang.com/v1/objects/6bce4ef400e4efaa63a13d5e6f6b500be969ef81/server.jar"
Name_Server_Fille="server.jar"
#--------------------------#


green="\e[1;32m"
reset="\e[0m"

echo "Download Minecraft Server"

for i in {1..3}; do
    echo -ne "${green} - ${reset}\r"
    sleep 0.3
    echo -ne "${green} -- ${reset}\r"
    sleep 0.3
    echo -ne "${green} --- ${reset}\r"
    sleep 0.3
    echo -ne "${green} -- ${reset}\r"
    sleep 0.3
    echo -ne "${green} - ${reset}\r"
    sleep 0.3
done
echo "Start Downloading"
sleep 2
./start-ubuntu.sh
apt update
apt-get clean
apt-get install -y build-essential
apt-get install software-properties-common
add-apt-repository ppa:openjdk-r/ppa
apt update
apt-get install openjdk-8-jre
apt-get install openjdk-17-jre
apt-get install openjdk-21-jre
apt-get install openjdk-25-jre
apt install nano
apt update
wget -O ${Name_Server_Fille} ${Link_Server}
echo '#!/bin/bash
java -Xmx${MAX_MEMORY}M -Xms${MIN_MEMORY}M -jar ${Name_Server_Fille} nogui' > start.sh
chmod +x start.sh
./start.sh
sleep 0.5
echo -e "${green}Complete Download${reset}"
sleep 3

