dotfiles
=====
This repository contains my personal configuration files for different development tools. Each directory has a README.md file with comments or directions for the corresponding tool. 


Fonts
------------
Install a NerdFont in order to have support for glyphs and ligatures since they will be needed for the terminal, Tmux and Neovim.

https://www.nerdfonts.com/font-downloads

I usually rotate between:
- Iosevka
- Hack
- JetBrains Mono

System Installation
------------
This is a basic list of packages that are needed when starting from a fresh installation of a Debian based distro(in wsl2 or natively). I gathered them here for easy reference.


Update first
```
sudo apt update
sudo apt upgrade
```
Install fonts (linux)
```
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.zip
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip "*.zip"
rm -r *.zip
fc-cache
```
Install c++/c essentials & CMake
```
sudo apt install build-essential
sudo apt install cmake
```

Install bat to have cat but with nice syntax higlighting
```
sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```

Can't live without ripgrep nor fzf :)
```
sudo apt-get install ripgrep
sudo apt install fzf
```

Install Nvim
```
cd ~/.local/bin/
sudo apt-get install fuse libfuse2
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage nvim
```

Next, install Docker. Since this might change, is easier to copy paste the commands from the official documentation. Install docker server and not docker desktop
Follow the official instructions: 
- https://docs.docker.com/engine/install/ubuntu/#installation-methods


Install tpm (tmux plugin manager)
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```


Set-Up
------------
I usually clone this (dotfiles) repository to ` ~/github/` and create symbolic links, that way my configuration is always tracked by git. 

so make sure that a configuration directory exists
```
mkdir ~/.config/
```
then create the symbolic links (change paths if you clone this directory to another location)
```
ln -s ~/github/dotfiles/nvim/ ~/.config/nvim
ln -s ~/github/dotfiles/tmux/ ~/.config/tmux
```







