#!/bin/ksh
echo `date`
rm bteqinput
. ./logon.dat    
echo "delete from student121.accounts all;" >bteqinput
while read line
do
fl1=`echo $line|cut -d '|' -f1`
fl2=`echo $line|cut -d '|' -f2`
fl3=`echo $line|cut -d '|' -f3`
fl4=`echo $line|cut -d '|' -f4`
fl5=`echo $line|cut -d '|' -f5`
fl6=`echo $line|cut -d '|' -f6`
fl7=`echo $line|cut -d '|' -f7`
fl8=`echo $line|cut -d '|' -f8`
echo "insert into student121.accounts values ($fl1,$fl2,'$fl3','$fl4','$fl5',$fl6,$fl7,$fl8);">>bteqinput
done < accountdata.txt 
echo $
bteq << EOF
.logon $TDP_ID/$USER_ID,$PASSWD
.run file=bteqinput
--.quit
EOF
echo `date`

