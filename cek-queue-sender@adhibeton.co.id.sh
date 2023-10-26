echo Login makek sudo dulu ya!!!!
echo Masukan email yg terindikasi spam! : 
read email
echo Tunggu ya..!! Email $email lagi dicek.

sudo /opt/zimbra/common/sbin/postqueue -p | egrep -v '^ *\(|-Queue ID-' | awk 'BEGIN { RS = "" } { if ($7 == $email) print $1} '
