#!/bin/bash
# rm_message.sh user@domain.com subject
if [ -z "$2" ]; then
echo "usage:  rm_message.sh user@domain.com <subject>"
exit 0
else
addr=$1
subject=$2
echo "Searching $addr  for Subject:  $subject"
for msg in `zmmailbox -z -m "$addr" s -l 999 -t message "subject:$subject"|awk '{ if (NR!=1) {print}}' | grep -v -e Id -e "-" -e "^$" | awk '{ print $2 }'`
  do
echo "Removing "$msg""
zmmailbox -z -m $1 dm $msg
done
fi
