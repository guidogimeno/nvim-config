# Nvim Config

## Install NeoVim
Pre-built packages for Windows, macOS, and Linux are found on the
[Releases](https://github.com/neovim/neovim/releases/) page.

[Managed packages] are in [Homebrew], [Debian], [Ubuntu], [Fedora], [Arch Linux], [Void Linux], [Gentoo], and more!

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

[Managed packages]: ./INSTALL.md#install-from-package
[Debian]: https://packages.debian.org/testing/neovim
[Ubuntu]: https://packages.ubuntu.com/search?keywords=neovim
[Fedora]: https://packages.fedoraproject.org/pkgs/neovim/neovim/
[Arch Linux]: https://www.archlinux.org/packages/?q=neovim
[Void Linux]: https://voidlinux.org/packages/?arch=x86_64&q=neovim
[Gentoo]: https://packages.gentoo.org/packages/app-editors/neovim
[Homebrew]: https://formulae.brew.sh/formula/neovim
