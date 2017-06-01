echo -e "Welcome To File uploader" | lolcat
echo -e "Script by ExCode72, Powered by Transfer.sh" | lolcat
echo ""
echo "===============================================================" | lolcat
echo =e "1.Isikan File Path dengan lokasi file anda. (Contoh: /home/babi)" | lolcat
echo -e "   2.Isikan Nama File sesuai nama file anda. (Contoh: babi)" | lolcat
echo "===============================================================" | lolcat

read -p "File Path: " path1
read -p "Nama File (dengan format): " nama1
echo -e "Berikut Link URL anda :"
curl --upload-file $path1 https://transfer.sh/$nama1
echo -e "Your File Has been Successfully Uploaded" | lolcat
