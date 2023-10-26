echo Login makek sudo dulu ya!!!!
echo Masukan email yg akan dihapus dari queue : 
read email
echo Tunggu ya.!! Lagi diproses..!!

sudo /opt/zimbra/common/sbin/postqueue -p |egrep -v '^ *\(|-Queue ID-' | awk 'BEGIN { RS = "" } { if ($7 == $email) print $1} '| tr -d '*!'| /opt/zimbra/common/sbin/postsuper -d -
