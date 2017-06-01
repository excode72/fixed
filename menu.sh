#!/bin/bash
clear

# get the VPS IP
#ip=`ifconfig venet0:0 | grep 'inet addr' | awk {'print $2'} | sed s/.*://`
MYIP=`wget -qO- ipv4.icanhazip.com`;
#MYIP=$(wget -qO- ipv4.icanhazip.com)
if [ "$MYIP" = "" ]; then
	MYIP=$(wget -qO- ipv4.icanhazip.com)
fi
#myip=`ifconfig | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | grep -Eo '([0-9]*\.){3}[0-9]*' | grep -v '127.0.0' | head -n1`;

flag=0

echo

	#MYIP=$(ifconfig | grep 'inet addr:' | grep -v inet6 | grep -vE '127\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' | cut -d: -f2 | awk '{ print $1}' | head -1)
	#if [ "$MYIP" = "" ]; then
		#MYIP=$(wget -qO- ipv4.icanhazip.com)
	#fi

	clear

	#echo "--------------- Selamat datang di Server - IP: $MYIP ---------------"
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	echo ""
	#cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	#cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	#freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	#tram=$( free -m | awk 'NR==2 {print $2}' )
	#swap=$( free -m | awk 'NR==4 {print $2}' )
	#up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

	#echo -e "\e[032;1mCPU model:\e[0m $cname"
	#echo -e "\e[032;1mNumber of cores:\e[0m $cores"
	#echo -e "\e[032;1mCPU frequency:\e[0m $freq MHz"
	#echo -e "\e[032;1mTotal amount of ram:\e[0m $tram MB"
	#echo -e "\e[032;1mTotal amount of swap:\e[0m $swap MB"
	#echo -e "\e[032;1mSystem uptime:\e[0m $up"
lolcat -F 0.3 -S 0 /usr/bin/bannermenu
echo "                           Server: $MYIP" | lolcat
date +"                           %A, %d-%m-%Y" | lolcat
date +"                                   %H:%M:%S %Z" | lolcat
echo ""
echo ""
PS3='Silahkan ketik nomor pilihan anda lalu tekan ENTER: '
echo ""
echo ""
options=("Buat User SSH" "Buat User SSH Trial" "Perbarui User" "Ganti Password User" "List User Dan Tanggal Kadaluarsa" "Monitor User Login" "Hapus User" "Ganti Hostname" "Ganti Password VPS" "Speedtest" "Benchmark" "Bersihkan Cache Ram Manual" "Edit Banner Menu" "Lihat Lokasi User" "Restart Webmin" "Restart Server VPS" "Restart Dropbear" "Restart OpenSSH" "File Uploader (NEW!)" "Update Script....!" "Quit") 
select opt in "${options[@]}"
do
    case $opt in
        "Buat User SSH")
	clear
        usernew
        break
            ;;
	"Buat User SSH Trial")
	clear
	trial | lolcat
	break
	;;
	"Perbarui User")
	clear
	userrenew
	break
	;;
	"Ganti Password User SSH")
	clear
	userpass | lolcat
	echo -e "Sukses Mengganti Password user...............!" | lolcat
	break
	;;
	"List User Dan Tanggal Kadaluarsa")
	clear
	userlist | lolcat
	break
	;;
	"Hapus User")
	clear
	hapus
	break
	;;
	"Ganti Password VPS")
	clear
	echo "=====================================================================" | lolcat
	echo -e " Password saat diketik memang tidak terlihat " | lolcat
	echo "=====================================================================" | lolcat
	read -p "Tekan ENTER untuk melanjutkan ke pengisian password..............!" | lolcat
	passwd root
	echo -e "Selamat Password VPS anda sudah di ganti....." | boxes -d cat | lolcat
	break
	;;
	"Ganti Hostname")
	clear
	read -p "Isi Hostname: " hostname1
	hostnamectl set-hostname $hostname1
	echo -e "Hostname sudah diganti, silahkan login kembali" | boxes -d boy | lolcat
	exit
	break
	;;
	"Monitor User Login")
	clear
	userlog | lolcat
	break
    ;;
	"Bersihkan Cache Ram Manual")
	clear
	echo "Sebelum..." | lolcat
       free -h
	echo 1 > /proc/sys/vm/drop_caches
	sleep 1
	echo 2 > /proc/sys/vm/drop_caches
	sleep 1
	echo 3 > /proc/sys/vm/drop_caches && swapoff -a && swapon -a
	sleep 1
	echo ""
	echo "Sesudah..." | lolcat
	free -h
	echo "SUKSES..!!!Cache ram anda sudah di bersihkan." | boxes -d boy | lolcat
        break
	;;
	"Speedtest")
	clear
	echo "SPEEDTEST SERVER" | boxes -d peek | lolcat
	echo "-----------------------------------------"
	speedtest --share | lolcat
	echo "-----------------------------------------"
	break
	;;
	"Benchmark")
	clear
	echo "BENCHMARK" | boxes -d peek | lolcat
	benchmark | lolcat
	break
	;;
	"Edit Banner Menu")
	clear
	echo "--------------------------------------------------------" | lolcat
	echo -e "1. Simpan text (CTRL + X, lalu ketik Y dan tekan ENTER)" | lolcat
	echo -e "2. Membatalkan edit text (CTRL + X,lalu ketik N dan tekan ENTER)" | lolcat
	echo "--------------------------------------------------------" | lolcat
	read -p "Tekan ENTER untuk melanjutkan..................." | lolcat
	nano /etc/bannerssh
	break
	;;
	"Lihat Lokasi User")
	clear
	userlog | lolcat
	echo "Contoh: 112.123.345.126 lalu Enter" | lolcat
        read -p "Ketik Salah Satu Alamat IP User: " userip
        curl ipinfo.io/$userip
	echo "-----------------------------------" | lolcat
        break
	;;
	"Restart Webmin")
	clear
	 service webmin restart
	 echo "Webmin sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Restart Server VPS")
	 clear
	 rebootvps
	 echo "Proses Rebooting.........................." | boxes -d boy | lolcat
	 break
	 ;;
	 "Restart Dropbear")
	 clear
	 service dropbear restart
	 echo "Dropbear sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "Restart OpenSSH")
	 clear
	 service sshd restart
	 echo "OpenSSH sudah di restart boss!!!" | boxes -d boy | lolcat
	 break
	 ;;
	 "File Uploader (NEW!)")
	 clear
	 uploader | lolcat
break
;;

	"Update Script....!")
	clear
	cd
	wget -O menu https://raw.githubusercontent.com/excode72/fixed/centos8/menu.sh
	mv menu /usr/bin
	chmod +x menu
	wget https://raw.githubusercontent.com/excode72/fixed/centos8/update.sh
	clear
	sh update.sh
	break
;;
	"Quit")
	
	break
	;;
	 
        *) echo invalid option;
	esac
done
