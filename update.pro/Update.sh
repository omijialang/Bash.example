#!/bin/sh

. /haha/functions

Target_Dir="update"
Dir_tmp=`mktemp -d -p /tmp -t update.XXX`
Tar_tmp=`date +update-%Y.%m.%d.tar.gz`

sed -n -e '1, /^exit 0$/!p' $0 > $Dir_tmp/$Tar_tmp

pushd $Dir_tmp 1>&2

tar xzf $Tar_tmp || Err_Handle $0 $LINENO
cd $Target_Dir
./Update_autorun || Err_Handle $0 $LINENO

popd 1>&2

rm -rf $Dir_tmp 
exit 0
