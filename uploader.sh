echo -e "Welcome To File uploader" | lolcat
echo -e "Script by ExCode72, Powered by Transfer.sh" | lolcat
echo ""
echo "===============================================================" | lolcat
echo -e "1.Isikan File Path dengan lokasi file anda. (Contoh: /home/babi.txt)" | lolcat
echo -e "2.Isikan Nama File sesuai nama file anda. (Contoh: babi.txt)" | lolcat
echo -e "NB: File Size up to 10GB" | lolcat
echo "===============================================================" | lolcat
read -p "File Path: " pathanda
read -p "Nama File: " fileanda

echo -e "Berikut Link URL anda :"
curl --upload-file $pathanda https://transfer.sh/$fileanda
echo -e ""
echo -e "Your File Has been Successfully Uploaded" | lolcat
