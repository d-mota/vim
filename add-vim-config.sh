#!/bin/bash
export VIMDIR=~/.vim
export VIMFILE=~/.vimrc
if [ -f $VIMFILE ]; then
	echo "You already have a $VIMFILE! Cancelling!"
	exit 1
fi
if [ -d $VIMDIR ]; then 
	echo "You already have a $VIMDIR directory! Cancelling!"
	exit 1
fi
git clone https://github.com/d-mota/vim.git $VIMDIR
ln -s $VIMDIR/init.vim $VIMFILE

