#!/bin/sh

DOC=$( find $1 -type d -name doc )
CWD=$( cd $( dirname $0 ) && pwd )

GREEN="[32;01m"
RED="[31;01m"
PURP="[35;01m"
BLDWHT="[37;01m"
BLDYEL="[33;01m"
OFF="[0m"

for i in $DOC;do
    i=${i#./}
    cd $i
    vim "+:helptags ." "+:q"
    [ -f tags ] && echo "${GREEN}Generated${OFF} $i/tags" || "${RED}Failed${OFF} $i/tags"
    cd $CWD
done
