# .bashrc

# User specific aliases and functions

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

MYIP=$(wget -qO- ipv4.icanhazip.com)
#echo -e $green' ☠>_________________'
clear
echo "" | lolcat
echo "" | lolcat
echo "" | lolcat
echo "            --[ SELAMAT DATANG  DI VPS ExCode72 ]--"| boxes -d dog | lolcat
echo "            ====================================================="| lolcat
echo "            #           WhatsApp     : 082139743432             #"| lolcat
echo "            #           Line         : nevd72                   #"| lolcat
echo "            #           Facebook     : fb.com/rakel.danhiguain  #"| lolcat
echo "            #---------------------------------------------------#"| lolcat
echo "            #          Silahkan ketik [menu] lalu ENTER         #"| lolcat
echo "            #---------------------------------------------------#"| lolcat
echo "            #       Copyright: © ExCode72 Premium Plus 2017     #"| lolcat
echo "            ====================================================="| lolcat
date +"                            %A, %d-%m-%Y" | lolcat
date +"                                 %H:%M:%S %Z" | lolcat
echo ""
echo -e "            Server - IP: $MYIP " | lolcat
echo ""
	cname=$( awk -F: '/model name/ {name=$2} END {print name}' /proc/cpuinfo )
	cores=$( awk -F: '/model name/ {core++} END {print core}' /proc/cpuinfo )
	freq=$( awk -F: ' /cpu MHz/ {freq=$2} END {print freq}' /proc/cpuinfo )
	tram=$( free -m | awk 'NR==2 {print $2}' )
	swap=$( free -m | awk 'NR==4 {print $2}' )
	up=$(uptime|awk '{ $1=$2=$(NF-6)=$(NF-5)=$(NF-4)=$(NF-3)=$(NF-2)=$(NF-1)=$NF=""; print }')

echo -e "            \e[032;1mCPU model:\e[0m $cname" | lolcat
echo -e "            \e[032;1mNumber of cores:\e[0m $cores" | lolcat
echo -e "            \e[032;1mCPU frequency:\e[0m $freq MHz" | lolcat
echo -e "            \e[032;1mTotal amount of ram:\e[0m $tram MB" | lolcat
echo -e "            \e[032;1mTotal amount of swap:\e[0m $swap MB" | lolcat
echo -e "            \e[032;1mSystem uptime:\e[0m $up" | lolcat
echo "----------------------------------------------------------------------" | lolcat
echo ""
