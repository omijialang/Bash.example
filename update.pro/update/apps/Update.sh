#!/bin/sh

. /haha/functions

cat UpdateFiles | while read Src_File Dest_File Owner Group Mode Md5Sum; do

#	echo "Src_File=" $Src_File
#	echo "Dest_File=" $Dest_File
#	echo "Owner=" $Owner
#	echo "Group=" $Group
#	echo "Mode=" $Mode
#	echo "Md5Sum=" $Md5Sum
#	echo -e "############################\n"
	if [ ! -z $Md5Sum ]; then
		sum=`md5sum $Src_File | cut -d' ' -f 1`
		[ $sum != $Md5Sum ] && echo "update abort: file $Src_File has been damaged!" 1>&2 && exit 24
	fi
	File_Install $Src_File $Dest_File $Owner $Group $Mode $LINENO || Err_Handle $0 $LINENO
done
