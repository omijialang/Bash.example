#!/bin/sh

# if you want change $Target_Dir please change it in Update.sh too
Target_Dir="update"

GZ_Name="update.tar.gz"
Bin_Name=${1:-update.bin}
Sub_Target_Dir=

pushd $Target_Dir
for dir in `find . -maxdepth 1 -type d`; do
	if [ $dir != "." ]; then
		Sub_Target_Dir=${dir:2}		
#		echo $Sub_Target_Dir
		[ -f $Sub_Target_Dir/UpdateFiles -a -f $Sub_Target_Dir/Update.sh ] && \
		tar czf $Sub_Target_Dir.tar.gz $Sub_Target_Dir
	fi
done
popd

tar czf $GZ_Name $Target_Dir/*.tar.gz $Target_Dir/Update_autorun
cat Update.sh $GZ_Name > $Bin_Name 

chmod a+x $Bin_Name
