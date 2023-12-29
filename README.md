# Nvim Config

## Install dependencies
*May defer depending on the OS you are working on*
```
sudo apt install fd-find
```
```
sudo apt install ripgrep
```

## Install packer
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
Then go to the **packer.lua** file and execute:
```
:PackerSync
```

## Install Golang Debugger
```
go install github.com/go-delve/delve/cmd/dlv@latest
```

