

<!-- <center><img src="img/dotfiles_logo.svg" alt="dotfiles logo" width=600 ></center> -->
<!-- <center><img src="img/dotfiles_logo.svg" alt="dotfiles logo" width=400 ></center> -->
<center><img src="img/alone_green.svg" alt="dotfiles logo" width=400 ></center>

![Fedora](https://img.shields.io/badge/Fedora-black?style=for-the-badge&logo=fedora)


This repository contains my personal configuration files for different tools. Each directory has a README.md file with comments or instructions for the corresponding tool. I currently do all my development work in Linux or WSL. 

In Linux based systems, I usually clone this (dotfiles) repository to ` ~/github/` and create symbolic links, that way my configuration is always tracked by git.

so make sure that a configuration directory exists
```
mkdir ~/.config/
```
then create the symbolic links to the appropriate tools (change paths if you clone this directory to another location)
```
ln -s ~/github/dotfiles/nvim/ ~/.config/nvim
ln -s ~/github/dotfiles/tmux/ ~/.config/tmux
ln -s ~/github/dotfiles/starship/starship.toml ~/.config/starship.toml
```


> **_NOTE:_**  If I need to use Wezterm in windows, I usually copy the "wezterm" directory into "C:\Users\\< username >\\ .config\". This might work for other tools as well, so double check the tools own documentation. 


# System Set-up for Linux Environments
This is a quick reference on the minimum packages that I use in all my Linux (and WSL) instances. I gathered them here for easy reference.


## Fonts
Install a NerdFont in order to have support for glyphs and ligatures since they will be needed for the terminal, Tmux and Neovim.

https://www.nerdfonts.com/font-downloads

I usually rotate between:
- Iosevka
- Hack
- JetBrains Mono


Use the following commands to install in an easy way. 
```
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.zip
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
cd ~/.local/share/fonts
unzip "*.zip"
rm -r *.zip
fc-cache
```

## Docker
Since this might change more often than not, it might be easier to copy paste the commands from the official documentation. Make sure to install docker server and not docker desktop.
Follow the official instructions: https://docs.docker.com/engine/install/ubuntu/#installation-methods


## Debian and Ubuntu Packages


**Update first**
```
sudo apt update
sudo apt upgrade
```


**Install c++/c essentials & CMake**
```
sudo apt install build-essential
sudo apt install cmake
```


**Install bat to have cat but with nice syntax higlighting**
```
sudo apt install bat
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
```

**Install ripgrep & fzf**
```
sudo apt-get install ripgrep
```

Ubuntu's package manager has a very old version of fzf, which lacks some important features.
So install from source
```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
cd ~/.fzf && git pull && ./install
```

**Install Nvim**
Ubuntu's package manager has a very old version of NeoVim, so the recommended way is to use the appimage.

```
cd ~/.local/bin/
sudo apt-get install fuse libfuse2
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage nvim
```


**Install tpm (tmux plugin manager)**
```
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

**Install Starship prompt**

For the latest installation guide, check the official website: https://starship.rs/guide/#%F0%9F%9A%80-installation
Otherwise, we can follow the basic installation steps. First, curl the installation script:

```
curl -sS https://starship.rs/install.sh | sh
```

then appent the command  `eval "$(starship init bash)"` at the end of the `~/.bashrc` file. A simple one liner is:

```
echo "eval \"\$(starship init bash)\"" >> ~/.bashrc
```








