echo "Masukan email spam (ex: sender@ex.com / @ex.com) :"
read sender_email

sudo su 
su - zimbra 

echo "Cek total user yg ada di server..!!"
totgaa = zmprov -l gaa -s `zmhostname` | wc -l
echo Total User "totgaa"

for user in `zmprov -l gaa`
do
    echo Prepare to cek mailbox user : "$user"    
    zmmailbox -z -m $user s -t message -l 1000 "in:Inbox From:$sender_email" | awk 'FNR>4 {print $2}' > log_action_rm/$user.msgid
    baris = wc -l /tmp/tes.txt | awk '{print $1}'
    echo Ditemukan "$baris" email di mailbox "$user"
    while IFS= read -r line; do
        if $line > 0
        then
            zmmailbox -z -m $user deleteMessage $line
            echo Deleted msgid = "$line" from mailbox "$user" 
        fi        
    done < log_action_rm/$user.msgid
done
