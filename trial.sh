#!/bin/bash
#Script auto create trial user SSH
Login=trial-`</dev/urandom tr -dc X-Z0-9 | head -c4`
expire="1"
Pass=`</dev/urandom tr -dc a-f0-9 | head -c9`
IP=`wget -qO- ipv4.icanhazip.com`
useradd -e `date -d "$expire days" +"%Y-%m-%d"` -s /bin/false -M $Login
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e "Akun Trial anda sudah jadi......."
echo -e "==================================="
echo -e "Host: $IP" 
echo -e "Port: 443"
echo -e "Squid Port: 8080,80"
echo -e "Username: $Login "
echo -e "Password: $Pass\n"
echo -e "==================================="
echo -e ""
echo -e "Akun ini hanya aktif 1 hari"
echo -e "Script by ExCode72"
