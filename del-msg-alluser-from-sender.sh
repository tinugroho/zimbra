
#!/bin/bash
echo "Masukan email spam (ex: sender@ex.com / @ex.com)";
read sender_email

LOG="/tmp"
echo Cek total user yg ada di server..!!
TOTGAA= /opt/zimbra/bin/zmprov -l gaa| wc -l
echo "Total Users"
for user in `/opt/zimbra/bin/zmprov -l gaa`
    do
        echo Prepare to cek mailbox user : "$user"
        for line in `/opt/zimbra/bin/zmmailbox -z -m $user s -t message -l 1000 "in:Inbox From:$sender_email" | awk 'FNR>4 {print $2}'`
            do
                if [[ $line -gt 0 ]]
                    then
                        /opt/zimbra/bin/zmmailbox -z -m $user deleteMessage $line
                        echo Deleted msgid = "$line" from mailbox "$user"
                fi
            done
    done

