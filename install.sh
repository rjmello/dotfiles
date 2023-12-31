#!/usr/bin/env bash

DOTFILES="
	bashrc
	bash_completions.d
	bash_logout
	gitconfig
	profile
	tmux.conf
"


cd $(dirname ${BASH_SOURCE[0]})


echo
echo "Installing dotfiles ..."
for file in $DOTFILES; do
	echo "Linking $file"
	ln -sfT $PWD/$file ~/.$file
done


echo 
echo "Installing bin files ..."
pushd bin
mkdir -p ~/bin
for file in *; do
	echo "Linking $file"
	ln -sfT $PWD/$file ~/bin/$file
done
popd