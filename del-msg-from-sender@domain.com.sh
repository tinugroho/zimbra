echo Login makek sudo dulu ya!!!!
echo Delete all message on all user from sender : 
read sender_email
echo Tunggu ya.!! Lagi diproses..!!

sudo su
su - zimbra
for msg in `zmmailbox -z -m "$sender_email" s -l 999 |awk '{ if (NR!=1) {print}}' | grep -v -e Id -e "-" -e "^$" | awk '{ print $sender_email }'`
  do
echo "Removing "$msg""
zmmailbox -z -m $sender_email dm $msg
done
