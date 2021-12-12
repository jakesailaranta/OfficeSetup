# SaltStack architecture for an office environment

A base template of SaltStack states and a Highstate for configuration of Windows and Debian-based (Debian/Ubuntu) boxes. In it's current state it installs various essential programs to all machines, sets up a method to add document templates to LibreOffice for everyone in the environment, change wallpapers and install some additional purpose-specific programs dependent on the department the box has been assigned to (possible departments currently: Development, Media and Webserver).

Built and tested on an environment of multiple Debian, Ubuntu and Windows virtual machines, with Salt Master ran specifically on Debian-11 Bullseye. Functionality in other Linux distros is not guaranteed.

Built as the final project for Haaga-Helia University of Applied Science's "Palvelinten Hallinta" -course, run by Tero Karvinen. In it's base state, this build is best used as a guideline for setting your own environment up, though the customization does require some understanding of SaltStack's functionality and YAML. The guide below will attempt to inform how to use these states regardless.

## KNOWN ISSUES
* The state meant for Media department boxes has functionality only for Windows boxes currently, due to installation for Linux being too involved to be able to be handled easily through SaltStack
* Some packages may fail to install on initial run, only to install just fine on a repeated run. Reason behind this is unclear, hypothesis is that a connectivity issue to the repository the packages are drawn from may be happening sometimes.

## HOW TO
### Install this build
The choice of programs in this build is largely arbitrary and made purely for development purposes, but if you want to take this setup wholesale and either customize it from there or outright use what is already there without further edit, do the following:
* Install salt-master on your intended controller (must be a Linux machine; salt-master is not available for Windows). `sudo apt-get install salt-master` should work at least on Debian distro.
* Install salt-minion on all the machines you intend to be controlled by Salt. Tutorials on how to do this for various OS can be found in: [https://repo.saltproject.io](https://repo.saltproject.io)
* On all minions, set the master as your controller's IP, and prepend the ID of the minions either with 'dev-' for development, 'media-' for media or 'web-' for webserver (ie: dev-01). On linux machines you can set these through `/etc/salt/minion`, on Windows you are given the option during the installation wizard. Note that on Linux-machines after changing the configuration file you will also need to restart the minion service (`sudo systemctl restart salt-minion`) for the changes to take effect.
* On the controller, run the command `sudo salt-key -A` and accept all the keys.
* On Windows, enable both firewall rules named `File and Printer Sharing (Echo Request - ICMPv4-In)`.
* git-pull this repository to your Master's `/srv/salt/` directory.
* If you have Windows boxes in your environment, follow the Windows Repos guide below before running the next step
* Run the command `sudo salt '*' state.highstate` and go have a cup of coffee while Salt applies all the states on your boxes.

### Windows Repos
The states will attempt to install various packages on all the machines, but Windows by default lacks a package handler. Installing Chocolatey package handler is included here, but that also requires at least a basic package handler. Make sure you have git installed and run the following commands before running the highstate:
```
sudo mkdir /srv/salt/win
sudo chown root.salt/srv/win
sudo chmod ug+rwx /srv/salt/win
sudo salt-run winrepo.update_git_repos
sudo salt -G 'os:windows' pkg.refresh_db
```
You may need to run the last command every time you add a new Windows box to the Salt environment post-initial setup.

### Changing the wallpaper
The states windowsuniversal and ubuntuwallpaper attempt to change the default wallpaper on all machines. Currently only works on Windows boxes and Linux boxes running the Gnome desktop environment. An attempt was made to give functionality for XFCE desktop environments, but the command-line method to do so demands information that varies with the hardware setup of the box.

Simply replace wallpaper.png in both windowsuniversal and ubuntuwallpaper -folders in order to choose your own wallpaper to be given to the machines. The name of the file must still be wallpaper.png, however.

### Adding new document templates to LibreOffice
The directory /universal/common/* is used as the source for LibreOffice's templates in the state. Simply add your own templates to the corresponding subdirectories within and run the state again.

### Default Web Page for web-server
index.html in the directory web is used as the source for the default web page displayed by Apache. The file currently is only a placeholder; replace it with an index.html file of your own making.

### Web-server's ssh-server's config
The file sshd_config in the directory web is used as the source for web-servers' ssh-server's configuration. Notable change inside is that the port used has been changed from the default 22 to 2222. You can edit this file to your liking to apply your own configuration.

### Deeper customization
Changing the installed programs, adding new configuration files to be managed and setting rules for windows' firewall require some understanding of SaltStacks functionality and YAML. It is recommended that you familiarize yourself with Saltstack's [Tutorials](https://docs.saltproject.io/en/getstarted/) if you haven't already, and [further documentation on salt modules](https://docs.saltproject.io/en/latest/py-modindex.html) as needed if you want to work deeper with these.

You can remove or add programs to be installed by these states by editing the init.sls files found in any of universal, linuxuniversal, windowsuniversal, web, dev and media folders, corresponding to their targeted departments. It is important you follow the indentation rules (two empty spaces in relation to the last when adding a sub-line), or the code will break. Some packages require different names dependent on the OS, the conditional if/else statements in some of these files can help guide you.

The state windowsuniversal also has a module defined to ensure Windows Firewall is turned on. You can edit the Firewall rules with Salt too, but no rules currently exist in this build, and will need to be added fresh. Refer to [https://docs.saltproject.io/en/latest/ref/modules/all/salt.modules.win_firewall.html](https://docs.saltproject.io/en/latest/ref/modules/all/salt.modules.win_firewall.html) for further info.
