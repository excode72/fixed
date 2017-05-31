#!/bin/bash
#Script auto create trial user SSH
#yg akan expired setelah 1 hari
#www.fawzya.net - 085799054816

read -p "Username : " Login
read -p "Password : " Pass
read -p "Expired (hari): " masaaktif

IP=`wget -qO- ipv4.icanhazip.com`
useradd -e `date -d "$masaaktif days" +"%Y-%m-%d"` -s /bin/false -M $Login
exp="$(chage -l $Login | grep "Account expires" | awk -F": " '{print $2}')"
echo -e "$Pass\n$Pass\n"|passwd $Login &> /dev/null
echo -e ""
echo -e "Akun anda sudah berhasil dibuat...." | lolcat
echo -e "Informasi SSH" | lolcat
echo -e "=========-account-==========" | lolcat
echo -e "Host: $IP"  | lolcat
echo -e "Port: 443,143,80" | lolcat
echo -e "Squid Port: 8080" | lolcat
echo -e "Username: $Login " | lolcat
echo -e "Password: $Pass" | lolcat
echo -e "-----------------------------" | lolcat
echo -e "Aktif Sampai: $exp" | lolcat
echo -e "===========================" | lolcat
echo -e "Semoga akunnya Bermanfaat" | lolcat
echo -e "Script by ExCode72" | lolcat
