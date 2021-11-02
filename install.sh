#!/usr/bin/env bash

backup() {
	echo "Haciendo backup..."
	sleep 2
	mv ~/.config/nvim ~/.config/NeovimBackupVS
	echo "listo!"
	install_vsvim
}

update(){
	echo "Actualizando..."
	sleep 3
	cp *.vim ~/.config/nvim
	echo "Actualizacion exitosa"
}

install_vsvim() {
	echo "Instalando configuracion..."
	LCLDIR="$HOME/.local/bin"
	if [[ ! -d $LCLDIR ]]; then
		mkdir -p ~/.local/bin
	fi
	sleep 3
	mkdir ~/.config/nvim
	cp *.vim ~/.config/nvim
	cp .IDVSVIM ~/.config/nvim
	echo 'PATH=$PATH:~/.local/bin' >> ~/.profile
	echo 'PATH=$PATH:~/.local/bin' >> ~/.zshrc
	echo 'PATH=$PATH:~/.local/bin' >> ~/.bashrc
	chmod +x resources/*
	cp resources/* ~/.local/bin
	echo "~/.local/bin/checkupg" >> ~/.zshrc
	echo "~/.local/bin/checkupg" >> ~/.shrc
	echo "~/.local/bin/checkupg" >> ~/.bashrc
	echo "~/.local/bin/checkupg" >> ~/.cshrc
	nvim -c ":PlugInstall | :qa!"
	echo "instalación exitosa"
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
