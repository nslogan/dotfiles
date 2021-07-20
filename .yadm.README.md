# Logan's dotfiles

My dotfiles are managed by [yadm](https://yadm.io/).

This is very much a work in progress.

## Bootstrap

```
sudo apt -y --install-recommends install yadm
yadm clone git@github.com:nslogan/dotfiles.git
```

## TODO

- [ ] Add .gdbinit
- [ ] Customize .bashrc
- [ ] Customize .vimrc
- [ ] Add files to .gitignore
- [ ] Create bootstrap script (should include managing my `apt` packages, maybe a standard ARM toolchain)
- [ ] Migrate ST3 repo into this one
- [ ] Add ST3 licenses into encrypted part of yadm
- [ ] Add `$USER` to groups: `docker`, `dialout`, ...
- [ ] Also add some basic udev rules to make blackmagic probe, FTDI, etc. programmers work

## INBOX

To be organized.


### Disk configuration:

Carried out during machine commissioning, could be automated (?)

`/home` on separate partion
`/home/opt` mounted as /opt (https://askubuntu.com/questions/237272/how-to-put-opt-and-home-on-the-same-partition-but-different-from)

### Desktop Settings

- Remap caps to escape, both shift to caps
- Configure screen blanking to 30 minute timeout (not available in GUI)
- Disable tap-to-click on trackpad

-------------------------------------------------------------------------------


Configuration:
- Change terminal theme
	- ACTION: Figure out how to save this theme as a custom one and check it into yadm
	- SEE: https://gist.github.com/reavon/0bbe99150810baa5623e5f601aa93afc
	- SEE: https://unix.stackexchange.com/questions/448811/how-to-export-a-gnome-terminal-profile
- Set up new SSH key
	- SEE: https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account

InSync (Linux Google Drive application)

sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys ACCAF35C
echo "deb http://apt.insync.io/ubuntu bionic non-free contrib" | sudo tee /etc/apt/sources.list.d/insync.list
sudo apt update
sudo apt install insync

Fix HiDPI: https://help.insynchq.com/en/articles/2358580-linux-enabling-hidpi-setting (doesn't seem to be working yet...)


# Sublime Text
# FROM: https://www.sublimetext.com/docs/3/linux_repositories.html

# TODO: Check that this key isn't already present
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
sudo apt -y --install-recommends install apt-transport-https
# TODO: Check that this hasn't already been done
echo "deb https://download.sublimetext.com/ apt/dev/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt -y --install-recommends install sublime-text sublime-merge

# Spotify

curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client

# Docker

https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-18-04

sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sudo apt update

Make sure that `apt-cache policy docker-ce` returns something like this:

```
docker-ce:
  Installed: (none)
  Candidate: 18.03.1~ce~3-0~ubuntu
  Version table:
     18.03.1~ce~3-0~ubuntu 500
        500 https://download.docker.com/linux/ubuntu bionic/stable amd64 Packages
```

> Notice that docker-ce is not installed, but the candidate for installation is from the Docker repository for Ubuntu 18.04 (bionic).

sudo apt install docker-ce

Make sure it's running:

sudo systemctl status docker

(optional) Execute docker without sudo

sudo usermod -aG docker ${USER}

(requires logout-login cycle)


Python:

pip3 install --user pipenv

Try to do most of your dev through pipenv; install minimal number of things outside of it
