cd
wget -O trial "https://raw.githubusercontent.com/excode72/fixed/centos8/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/excode72/fixed/centos8/hapus.sh"
mv trial /usr/bin
mv hapus /usr/bin
chmod +x /usr/bin/trial
chmod +x /usr/bin/hapus
echo -e "Update kali ini :" | lolcat
echo -e "Script Trial................!" | lolcat
echo -e "Script Hapus User...........!" | lolcat
echo -e ""
echo -e "Semua Script diatas berhasil di Update!!" | lolcat
rm update.sh
