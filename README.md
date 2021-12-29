<p align="center">
  <img src="https://user-images.githubusercontent.com/59105868/147696668-8b35cba4-f27e-4cad-b901-6757a93d1ba8.png" />
</p>
<h4 align="center">Complete NeoVim setup look like Visual Studio Code for programming in Rust, Python, C/C++, Javascript and Web</h1>

## Dependencies
```
pyright - clangd - rust_analyzer - tsserver - vscode-langservers-extracted - xclip - xsel
```
## FreeBSD Dependencies
```
gsed
```
# Instalation
```sh
git clone https://github.com/SrWither/VsVim
cd VsVim
chmod +x install.sh
./install.sh
```
## Update VsVim
```sh
vsvupg
```
This command automatically downloads and applies the update

If you want VsVim to update only every time you open terminal

you must go to ~/.local/bin, edit the checkupg file and uncomment this line

![image](https://user-images.githubusercontent.com/59105868/139931592-ae47b8b7-3d32-48a5-88de-050e77d748b2.png)

and comment the line above
##### If TreeSitter does not install the syntax, open neovim and enter the following command
```
:TSInstall all
```
# Preview
## Theme
#### One Dark

![image](https://user-images.githubusercontent.com/59105868/139554329-8b6abf25-6d51-49ae-9f63-ddf20dd6ba02.png)

## Dashboard

![image](https://user-images.githubusercontent.com/59105868/139941484-9b51380e-0cab-4766-9c80-7d521d08d6a1.png)

## Code Completion
#### Python

![image](https://user-images.githubusercontent.com/59105868/139554350-43cc3023-4d8b-4726-baf2-8dcb0d9f3258.png)

#### Python Virtualenv

![image](https://user-images.githubusercontent.com/59105868/139590020-91996d48-64c8-47f7-8e71-817d4a3b0c7d.png)

###### Zsh - Bash - Sh
```sh
export VIRTUAL_ENV=$(pwd)/venv/
source venv/bin/activate
nvim .
```
###### Csh
```sh
setenv VIRTUAL_ENV `pwd`/venv/
source venv/bin/activate
nvim .
```
#### C/C++

![image](https://user-images.githubusercontent.com/59105868/139554520-b517eae8-7a58-47a8-a981-555664a62add.png)

#### Rust
![image](https://user-images.githubusercontent.com/59105868/139554779-a5e89801-b785-47b5-8bdf-caf1bb4cb8be.png)

#### Javascript / Typescript

![image](https://user-images.githubusercontent.com/59105868/139554858-2ef8de1b-4981-4444-9cb3-9df42ffaa348.png)

#### Html

![image](https://user-images.githubusercontent.com/59105868/139554899-0b4ff064-2afa-477a-bbaa-b199adcb67ff.png)

#### Css/Sass

![image](https://user-images.githubusercontent.com/59105868/139554949-bf113d3e-f85a-4b22-9d9f-589d202657d6.png)

## Crates

![image](https://user-images.githubusercontent.com/59105868/139554993-13ea595d-2020-4b42-abfa-ee2ec192248b.png)

## TreeFile And Terminal

#### NerdTree - ToggleTerm

![image](https://user-images.githubusercontent.com/59105868/139555061-7ccd1b34-12c8-4f6b-8e25-5f8649552288.png)

## Search for words

![image](https://user-images.githubusercontent.com/59105868/139555110-1f393d39-7128-4f40-b8c7-5158ca4a813a.png)

## Mouse Interaction

![MouseInteraction](https://user-images.githubusercontent.com/59105868/139555696-c9162701-a004-4e21-ac9c-531a5eecd053.gif)

## Keyboard shortcuts

| Ctrl + C | Ctrl + X | Ctrl + V | Ctrl + Z | Ctrl + Y | F2 | F3 | Ctrl + S | Ctrl + F | Ctrl + T | Tab |
| ----- | ----- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
|  Copy | Cut | Paste | Undo | Redo | Toggle NERDTree | Open Dashboard | Save File | Search words in the project | Open Terminal | to change the element in the code completion |

## Additional

#### you can use a rust version of NeoVim for better handling and visual improvement
https://github.com/vhakulinen/gnvim
