<p align="center">
  <img src="https://user-images.githubusercontent.com/59105868/147696668-8b35cba4-f27e-4cad-b901-6757a93d1ba8.png" />
</p>
<h4 align="center">Neovim configured to look like Visual Studio Code</h1>

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

If you want **VsVim** to update only every time you open terminal

you must go to `~/.local/bin`, edit the checkupg file and uncomment this line

![image](https://user-images.githubusercontent.com/59105868/139931592-ae47b8b7-3d32-48a5-88de-050e77d748b2.png)

and comment the line above
##### If TreeSitter does not install the syntax, open neovim and enter the following command
```
:TSInstall all
```
# Preview
## Theme
#### One Dark

![image](https://user-images.githubusercontent.com/59105868/147698509-2792b901-1d75-43da-b6c4-83420733a265.png)

## Dashboard

![image](https://user-images.githubusercontent.com/59105868/147704242-a2386978-0036-44af-9d1c-b035b1719804.png)

## Code Completion
#### Python

![image](https://user-images.githubusercontent.com/59105868/147699032-ddd47974-f8d0-4dea-a3db-8f2caf9e3fee.png)

#### Python Virtualenv

![image](https://user-images.githubusercontent.com/59105868/147698846-e9b9fb38-3063-4326-8640-2e2324d290e8.png)

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
#### C/C++
![image](https://user-images.githubusercontent.com/59105868/147699084-a4da695a-6871-4b45-bebe-5c6a267fa58d.png)

#### Rust
![image](https://user-images.githubusercontent.com/59105868/147699262-a6790a02-8aa1-409b-89a3-fc8142accc8c.png)

#### Javascript / Typescript
![image](https://user-images.githubusercontent.com/59105868/147699596-c46b1574-d052-49ff-ab44-058df57890d7.png)

#### Html
![image](https://user-images.githubusercontent.com/59105868/147700714-0328879e-c449-4ff4-8388-c341fba429e3.png)

#### Css/Sass
![image](https://user-images.githubusercontent.com/59105868/147700793-2d928886-40ce-415b-8608-7f7372beee5a.png)

## TreeFile And Terminal

#### Nvim-Tree.lua  - ToggleTerm

![image](https://user-images.githubusercontent.com/59105868/147701232-104321bd-527b-4a57-aa1e-ceefaea1de7a.png)

## Search for words
![image](https://user-images.githubusercontent.com/59105868/147702743-d432c4bb-68fa-4003-9c72-e65c65adb35f.png)

## Mouse Interaction

![MouseInteraction](https://user-images.githubusercontent.com/59105868/139555696-c9162701-a004-4e21-ac9c-531a5eecd053.gif)

## Keyboard shortcuts

| Ctrl + C | Ctrl + X | Ctrl + V | Ctrl + Z | Ctrl + Y | F2 | F3 | Ctrl + S | Ctrl + F | Ctrl + T | Tab |
| ----- | ----- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
|  Copy | Cut | Paste | Undo | Redo | Toggle NERDTree | Open Dashboard | Save File | Search words in the project | Open Terminal | to change the element in the code completion |

## Additional

#### you can use a rust version of NeoVim for better handling and visual improvement
https://github.com/vhakulinen/gnvim
