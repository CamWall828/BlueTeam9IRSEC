#!/bin/bash
user_array=("drwho" "martymcFly" "arthurdent" "samebeckett" "loki" "riphunter" "theflash" "tonystark" "drstrange" "bartallen")
sudo rm .Chungus.txt # Rename the txt file to a different directory and file whenver it's written to prevent breaking the build on github
touch .Chungus.txt

for i in ${user_array[@]}
do 
    pass=$(eval "openssl rand -base64 12")
    passFull="$pass - $i"
    echo $passFull >> .Chungus.txt
    echo "$i:$pass" | sudo chpasswd
done