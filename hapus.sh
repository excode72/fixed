#!/bin/bash
#Script Hapus User SSH
userlist
echo -e ""
read -p "Username yang akan dihapus : " Login
userdel $Login
echo -e ".................................................."
echo -e ""
echo -e "User \e[1;33;44m$Login\e[0m Berhasil dihapus"
