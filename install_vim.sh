#! /bin/sh
# Program:
#	Install the vim file to crrent user
# History:
#	2011/03/20	crhan	First release
PATH="/bin:/usr/local/bin:/usr/bin"

if [ -f $HOME/.vimrc ]
then
	mv $HOME/.vimrc{,.orig}
fi
if [ -d $HOME/.vim ]
then
	mv $HOME/.vim{,.orig}
fi

ln -s `pwd`/vimFiles $HOME/.vim
ln -s .vim/vimrc $HOME/.vimrc

exit 0
