#! /bin/sh
# Program:
#	Install the vim file to crrent user
# History:
#	2011/03/20	crhan	First release
PATH="/bin:/usr/local/bin:/usr/bin"
CWD=$( cd $( dirname $0 ) && pwd )

if [ -f $HOME/.vimrc ]
then
	mv $HOME/.vimrc{,.orig}
fi
if [ -d $HOME/.vim ]
then
	mv $HOME/.vim{,.orig}
fi

ln -sf $CWD/vimFiles $HOME/.vim
ln -sf .vim/vimrc $HOME/.vimrc

exit 0
