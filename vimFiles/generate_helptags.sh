#!/bin/sh

DOC=$( find $1 -type d -name doc )
CWD=$( cd $( dirname $0 ) && pwd )

for i in $DOC;do
    cd $i
    vim "+:helptags ." "+:q"
    [ -f tags ] && echo "$i/tags generated" || "$i/tags generate failed"
    cd $CWD
done
