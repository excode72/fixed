#!/bin/bash
#Script Auto Create User SSH By Ozikhacker. Powered by Fawzya.Net

MYIP=`wget -qO- ipv4.icanhazip.com`


read -p "Isikan username: " username

egrep "^$username" /etc/passwd >/dev/null
if [ $? -eq 0 ]; then
	#read -p "Isikan password akun [$username]: " password
	read -p "Berapa hari akun [$username] aktif: " AKTIF
	
	expiredate=$(chage -l $username | grep "Account expires" | awk -F": " '{print $2}')
	today=$(date -d "$expiredate" +"%Y-%m-%d")
	expire=$(date -d "$today + $AKTIF days" +"%Y-%m-%d")
	chage -E "$expire" $username
	passwd -u $username
	#useradd -M -N -s /bin/false -e $expire $username
clear


echo -e ""| lolcat
echo -e "|       Informasi Akun Baru SSH      |" | boxes -d dog | lolcat
echo -e "===========[[-PERPANJANG AKUN-]]============" | lolcat
echo -e "     Host: $MYIP" | lolcat
echo -e "     Username: $username" | lolcat
echo -e "                                           " | lolcat
echo -e "     Port default dropbear: 443,80         " | lolcat
echo -e "     Port default openSSH : 22,143         " | lolcat
echo -e "     Port default squid   : 8080           " | lolcat
echo -e "                                           " | lolcat
echo -e "-------------------------------------------" | lolcat
echo -e "     Akun Anda Sudah di Perpanjang         " | lolcat
echo -e "===========================================" | lolcat
echo -e ""
echo -e ""
else
	echo "Username [$username] belum terdaftar!"
	exit 1
fi

