#!/usr/bin/env bash

backup() {
  echo "Doing backup..."
  sleep 2
  mv ~/.config/nvim ~/.config/NeovimBackupVS
  echo "Done!"
  install_usuim
}

update(){
  echo "Updating..."
  sleep 3

  rm ~/.config/nvim/*.vim
  rm -rf ~/.config/nvim/autoload

  cp init.lua ~/.config/nvim

  mkdir -p ~/.config/nvim/autoload
  mkdir -p ~/.config/nvim/lua

  cp autoload/*.vim ~/.config/nvim/autoload
  cp -r lua/* ~/.config/nvim/lua
  cp resources/* ~/.local/bin

  ExternalConfig

  cp -r external/* ~/.config/usuim

  echo "Successful upgrade!"
}

install_usuim() {
  echo "Installing configuration..."
  LCLDIR="$HOME/.local/bin"
  if [[ ! -d $LCLDIR ]]; then
    mkdir -p ~/.local/bin
  fi
  sleep 3
  mkdir -p ~/.config/nvim
  mkdir -p ~/.config/nvim/lua
  mkdir -p ~/.config/nvim/autoload
  mkdir -p ~/.config/usuim

  cp init.lua ~/.config/nvim
  cp -r lua/* ~/.config/nvim/lua
  cp .IDUSUIM ~/.config/nvim
  cp autoload/*.vim ~/.config/nvim/autoload
  chmod +x resources/*
  cp resources/* ~/.local/bin
  cp -r external/* ~/.config/usuim
  echo "instalación exitosa"
}

CheckExistConfig() {

  DIRECTORY="$HOME/.config/nvim"
  ID="$HOME/.config/nvim/.IDUSUIM"

  if [[ ! -f $ID ]]; then
    if [[ ! -d $DIRECTORY ]]; then
      install_usuim
    else

            while true; do
            echo "Do you want to make a backup of your current configuration? (Y/N)"
            read -p "Option: " OPTION
            case $OPTION in
          y ) backup; break;;
              Y ) backup; break;;
              n ) install_usuim; break;;
          N ) install_usuim; break;;
            esac
      done
    fi

  elif [[ -f $ID ]]; then
    update

  else
    install_usuim
  fi
}

ExternalConfig() {
  DIRPATH="$HOME/.config/usuim"
  SETTINGS="$DIRPATH/settings.vim"
  PLUGINS="$DIRPATH/plugins.vim"
  MAPPING="$DIRPATH/mapping.vim"
  LSP="$DIRPATH/lsp.vim"
  COMMANDS="$DIRPATH/commands.vim"

  if [[ ! -d $DIRPATH ]]; then
    echo "+ $DIRPATH"
    mkdir ~/.config/usuim
  fi

  if [[ ! -f $SETTINGS ]]; then
    echo "+ $SETTINGS"
    cp external/settings.vim ~/.config/usuim
  fi

  if [[ ! -f $PLUGINS ]]; then
    echo "+ $PLUGINS"
    cp external/plugins.vim ~/.config/usuim
  fi

  if [[ ! -f $MAPPING ]]; then
    echo "+ $MAPPING"
    cp external/mapping.vim ~/.config/usuim
  fi

  if [[ ! -f $LSP ]]; then
    echo "+ $LSP"
    cp external/lsp.vim ~/.config/usuim
  fi

  if [[ ! -f $COMMANDS ]]; then
    echo "+ $COMMANDS"
    cp external/commands.vim ~/.config/usuim
  fi

}

CheckExistConfig
