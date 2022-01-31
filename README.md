<p align="center">
  <img src="https://user-images.githubusercontent.com/59105868/147696668-8b35cba4-f27e-4cad-b901-6757a93d1ba8.png" />
</p>
<h4 align="center">Neovim configured to look like Visual Studio Code</h1>

# :clipboard: Instalation
before installing check the [dependencies](https://github.com/SrWither/VsVim/blob/main/docs/dependencies.md#general) in the documentation

if you use FreeBSD you must install the following [dependencies](https://github.com/SrWither/VsVim/blob/main/docs/dependencies.md#freebsd)
```sh
git clone https://github.com/SrWither/VsVim
cd VsVim
chmod +x install.sh
./install.sh
```
## :recycle: Update VsVim
```sh
vsvupg
```
This command automatically downloads and applies the update

##### If TreeSitter doesn't install the syntax, open neovim and enter the following command
```
:TSInstall all
```
# Preview

###### Zsh - Bash - Sh
```sh
export VIRTUAL_ENV=$(pwd)/venv/
source venv/bin/activate
nvim .
```
###### Csh
```sh
setenv VIRTUAL_ENV `pwd`/venv/
source venv/bin/activate.csh
nvim .
```

## Keyboard shortcuts

| Ctrl + C | Ctrl + X | Ctrl + V | Ctrl + Z | Ctrl + Y | Ctrl + L | Ctrl + Q | Ctrl + 7 | F2 | F3 | Ctrl + S | Ctrl + F | Ctrl + B | Ctrl + T | Tab |
| ----- | ----- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
|  Copy | Cut | Paste | Undo | Redo | Format Code | Close Windows | Comment code | Toggle Nvim-Tree | Open Dashboard | Save File | Search words in the project | Open file browser | Open Terminal | to change the element in the code completion |

### Shortcuts in NvimTree
| a | d | r | R |
| ----- | ----- | ----- | ----- |
| Create files or folders| Delete files or folders | Rename files or folders | Reload tree |

## Additional

#### you can use a rust version of NeoVim for better handling and visual improvement
https://github.com/vhakulinen/gnvim
