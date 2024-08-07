dotfiles
=====
This repository contains my personal configuration files for different development tools. Each directory has a README.md file with comments or directions for the corresponding tool.

I have compiled a list of commands to install tools and packages that I use and need when fresh installing a VM and whotnot. I rely heavily on Docker to create my development environments, so things like python libraries, npm, etc wont be listed here since I have dedicated Docker images for those.


Fonts
------------
Install a NerdFont in order to have support for glyphs and ligatures since they will be needed for the terminal, Tmux and Neovim.

https://www.nerdfonts.com/font-downloads

I usually rotate between:
- Iosevka
- Hack
- JetBrains Mono

The method of installing the fonts depends on the OS. In Windows, we need to download the fonts manually, decompress them and drag them into the Fonts manager (unless you want to create a ps1 or bat script).

For linux, the installation can be achieved easily by running the following commands:
```
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Iosevka.zip
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/latest/download/Hack.zip
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
unzip "*.zip"
rm -r *.zip
fc-cache
```



System Installation
------------
This is a basic list of packages that are needed when starting from a fresh installation of a Debian based distro(in wsl2 or natively). I gathered them here for easy reference.


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
```
cd ~/.local/bin/
sudo apt-get install fuse libfuse2
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv nvim.appimage nvim
```

**Install Docker**

Since this might change more often than not, it might be easier to copy paste the commands from the official documentation. Make sure to install docker server and not docker desktop.
Follow the official instructions: https://docs.docker.com/engine/install/ubuntu/#installation-methods


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
ln -s ~/github/dotfiles/starship/starship.toml ~/.config/starship.toml
```







