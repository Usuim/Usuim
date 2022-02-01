#!/usr/bin/env bash

backup() {
	echo "Doing backup..."
	sleep 2
	mv ~/.config/nvim ~/.config/NeovimBackupVS
	echo "Done!"
	install_vsvim
}

update(){
	echo "Updating..."
	sleep 3
	cp *.vim ~/.config/nvim
	mkdir -p ~/.config/nvim/autoload
	cp autoload/*.vim ~/.config/nvim/autoload
	nvim -c ":PlugClean | :PlugUpdate | :qa!"
	echo "Successful upgrade!"
}

install_vsvim() {
	echo "Installing configuration..."
	LCLDIR="$HOME/.local/bin"
	if [[ ! -d $LCLDIR ]]; then
		mkdir -p ~/.local/bin
	fi
	sleep 3
	mkdir ~/.config/nvim
	mkdir -p ~/.config/nvim/autoload
	cp init.vim ~/.config/nvim
	cp plugs.vim ~/.config/nvim
	cp .IDVSVIM ~/.config/nvim
	cp autoload/*.vim ~/.config/nvim/autoload
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
	cp *.vim ~/.config/nvim
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
	    			echo "Do you want to make a backup of your current configuration? (Y/N)"
	    			read -p "Option: " OPTION
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
