#!/bin/sh

. /haha/functions

cat UpdateFiles | while read Src_File Dest_File Owner Group Mode; do

#	echo "Src_File=" $Src_File
#	echo "Dest_File=" $Dest_File
#	echo "Owner=" $Owner
#	echo "Group=" $Group
#	echo "Mode=" $Mode
#	echo -e "############################\n"

	File_Install $Src_File $Dest_File $Owner $Group $Mode $LINENO || Err_Handle $0 $LINENO
done
