#!/usr/bin/env bash

backup() {
	mv ~/.config/nvim ~/.config/NeovimBackupVS
	install_vsvim
}

update(){
	echo "Actualizando!"
	cp *.vim ~/.config/nvim
}

install_vsvim() {
	echo "instalando configuracion!"
	mkdir ~/.config/nvim
	cp *.vim ~/.config/nvim
	echo 'PATH=$PATH:~/.local/bin' >> ~/.profile
	cp resources/* ~/.local/bin
	nvim -c ":PlugInstall | :qa!"
	nvim -c ":TSInstall all"
}

CheckExistConfig() {
	
	DIRECTORY="$HOME/.config/nvim"
	ID="$HOME/.config/nvim/.IDVSVIM"
 	
	if [[ ! -f $ID ]]; then
		if [[ ! -d $DIRECTORY ]]; then
			install_vsvim
		else

        		while true; do
	    			echo "¿Quieres hacer un backup de tu configuracion actual? (Y/N)"
	    			read -p "Opcion: " OPTION
	    			case $OPTION in
					y ) backup; break;;
		    			Y ) backup; break;;
		    			n ) install_vsvim; break;;
					N ) install_vsvim; break;;
	    			esac
			done
		fi

	elif [[ -f $ID ]]; then
		update
	
	else
		install_vsvim
	fi
}

CheckExistConfig
