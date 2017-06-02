cd
wget -O trial "https://raw.githubusercontent.com/excode72/fixed/centos8/trial.sh"
wget -O hapus "https://raw.githubusercontent.com/excode72/fixed/centos8/hapus.sh"
mv trial /usr/bin
mv hapus /usr/bin
chmod +x /usr/bin/trial
chmod +x /usr/bin/hapus
echo -e "Update kali ini :"
echo -e "Script Trial................!"
echo -e "Script Hapus User...........!"
echo -e ""
echo -e "Semua Script diatas berhasil di Update!!"
rm update.sh
