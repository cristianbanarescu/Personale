#!/bin/bash

if [ "$#" -ne 0 ]; then
   
   file=fisier.txt
   sum=0
   for item in $*
   do
       sum=`expr $sum + $item`
       if [ "$?" -ne 0 ]; then
	   echo "Parametrul "$item" nu este numeric"
	   break
       fi
   done
   
   echo "Suma este:"$sum>$file
   
   count=0
   
   while [ $sum -gt 0 ] 
   
   do
       count=`expr $count + 1`            
       sum=`expr $sum / 10`           
   done
   
   echo "Suma este formata din "$count" cifre" >>$file       
else
echo "No parameters passed!"
fi

