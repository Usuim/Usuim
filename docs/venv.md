<h1 align="center">Python VirtualEnv</h1>

### Zsh - Bash - Sh
```sh
export VIRTUAL_ENV=$(pwd)/venv
source $VIRTUAL_ENV/bin/activate
nvim .
```
### Csh
```sh
setenv VIRTUAL_ENV `pwd`/venv
source $VIRTUAL_ENV/bin/activate.csh
nvim .
```
