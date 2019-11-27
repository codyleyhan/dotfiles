#!/bin/sh
PWD=`pwd`
USER_DIR=`echo ~`
FILES=(".tmux.conf:tmux.conf" ".config/nvim/init.vim:init.vim" ".zshrc:zshrc")

mkdir -p ~/.config/nvim

for file in "${FILES[@]}"; do
	KEY=${file%%:*}
	VALUE=${file#*:}
	DST="$USER_DIR/$KEY"
	SRC="$PWD/$VALUE"
	if [ ! -f $DST ]; then
		ln -s $SRC $DST
	fi
done
