Vscode Configuration
=====
This directory contains my vscode settings as well as a script called ` extensions.ps1` that installs all my current plug-ins. This is meant for Vscode running on Windows10 or Windows11. I placed this here to have easy refernce whenever I need to configure a new environment.



Extensions
------------
To move and install extensions between 2 Windows(10 or 11) machines, first run the following command in order to fetch and parse all the currently installed plug-ins:
```
code --list-extensions | ForEach-Object {"code --install-extension $_"} > extensions.ps1
```
This will generate a ps1 file. Take that file to the target computer ( the new computer) and run it:
```
.\extensions.ps1
```
If the script doesnt run, set the execution policy to remote and run the script again.
```
Set-ExecutionPolicy RemoteSigned
```
That should have installed everything


Settings & Keybindings
------------
copy paste the file contents into the ones from the new machine, respectively. That should work out of the box provided the fonts and plugins were installed before. 
