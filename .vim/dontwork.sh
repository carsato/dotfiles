#!/bin/bash

cd ~/
for i in `find .vim/bundle/ | grep -e ".vim$" `
do
	#echo $i
	res=`grep -Re "<html>" $i` 
	#echo $res  
	if [ "$res" == "<html>" ]
	then  
		#echo "--------------------"
		dontwork=`echo $i | cut -d"/" -f3`
		echo $i
		echo "$dontwork doesn't work"
		#echo $dontwork 
		echo "removing $dontwork ... (~/.vim/bundle/$dontwork) "
		rm -r ~/.vim/bundle/$dontwork
	fi
done
