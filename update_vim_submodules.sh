#!/bin/sh
PATH="/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"
CWD=$( cd $(dirname $0) && pwd )

sub_modules=$(git submodule status |awk '{print $2}')

if [ -n "$sub_modules" ]
then
    if [ -x "$(which parallel)" ];then
        parallel -i sh -c "cd {};pwd;git pull" -- $sub_modules
    else
        echo 'util `Parallel` not found'
    fi
else
    echo " * [31;01mError[0m: Not any git submodules find"
fi
