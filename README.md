



<p align="center"><img src="img/dotfiles_logo_green.svg" alt="Sublime's custom image" width=400 /></p>

<div align="center">

  <a style= "text-decoration: none;" href="">![Fedora](https://img.shields.io/badge/Fedora-grey?style=for-the-badge&logo=fedora)</a>
  <a style= "text-decoration: none;" href="">![Nvim](https://img.shields.io/badge/Neovim-%23262926?style=for-the-badge&logo=neovim)</a>
  <a style= "text-decoration: none;" href="">![Docker](https://img.shields.io/badge/Docker-%23dfdfeb?style=for-the-badge&logo=docker)</a>
  <a style= "text-decoration: none;" href="">![Tmux](https://img.shields.io/badge/Tmux-%23485249?style=for-the-badge&logo=tmux)</a>
  <a style= "text-decoration: none;" href="">![Starship](https://img.shields.io/badge/StarShip-%23443647?style=for-the-badge&logo=starship&logoColor=%23c540e3)</a>
  <a style= "text-decoration: none;" href="">![NerdFonts](https://img.shields.io/badge/NerdFonts-%23363232?style=for-the-badge&logo=nerdfont)</a>
  <a style= "text-decoration: none;" href="">![Ubuntu](https://img.shields.io/badge/Ubuntu-%2377216F?style=for-the-badge&logo=ubuntu)</a>
  
</div>

This repository contains my personal configuration files for different tools. Each directory has a README.md file with comments or instructions for the corresponding tool. I currently do all my development work in Linux or WSL. 



# How To Use

### Linux
I usually clone this (dotfiles) repository to ` ~/github/` and create symbolic links, that way my configuration is always tracked by git.

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
### Windows

The only tool that I use in windows is the Wezterm terminal. Just copy the "wezterm" directory into "C:\Users\\< username >\\ .config\"



# Linux Set-Up
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


## Fedora Packages

**update packages**
```
sudo dnf update
```

**enable flathub remote**
```
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

**enable rpm fusion (free)**
```
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm
```

**enable rpm fusion nonfree**
```
sudo dnf install https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
```

**update**
```
sudo dnf -y groupupdate core
```

**install media codecs**
```
sudo dnf -y swap 'ffmpeg-free' 'ffmpeg' --allowerasing
```

**fastfetch**
```
sudo dnf install fastfetch
```

**vscode**
```
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc 
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null
dnf check-update
sudo dnf install code
```

**cmake**
```
sudo dnf install cmake
```

**ripgrep and fzf**
```
sudo dnf install ripgrep fzf
```
In order to activate fzf keybindings, paste this into ~/.bashrc
```
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --bash)"
```

**bat**
```
sudo dnf install bat
```


## Ubuntu Packages


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








