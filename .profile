# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# `*PATH` modifications
# TODO: Write a function that:
# - Checks if the path provided exists and is a directory
# - Checks that the path is is not already in the target path
# - Can work for a general variable (e.g. PATH or PYTHONPATH)
# - Can append or prepend
# - Can take a set of paths
#
# NOTE: Probably want to implement a base function that takes "prepend" or "append" as arguments, then alias a set on top of that of arguments

# Prepending to PATH by default

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.nvm" ] ; then
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# I don't know if this is necessary anymore :thinking:
# # set PATH so it includes user's private bin if it exists
# if [ -d "$HOME/.local/bin" ] ; then
#     PATH="$HOME/.local/bin:$PATH"
# fi

# set PATH so it includes poetry bin if it exists
# NOTE: Looks like this is a deprecated path, poetry now puts things in $HOME/.local/bin
# if [ -d "$HOME/.poetry/bin" ] ; then
#     PATH="$HOME/.poetry/bin:$PATH"
# fi

# Modify path
# TODO: Wrap this to test for ~/bin
# PATH=/snap/bin:$PATH
# PATH=$HOME/.poetry/bin:$PATH

# There are two different ways on Ubuntu to install Go, (1) via apt, (2) via
# archive from go.dev (https://go.dev/doc/install).
#
# This logic is configured to give preference, if present, to the archive-based
# install method by placing that path ahead of the system install
if [ -d "/usr/local/go/bin" ]; then
    PATH=/usr/local/go/bin:$PATH
fi

if go version >/dev/null 2>&1; then
    # For `go install`
    PATH=$PATH:$(go env GOPATH)/bin
fi

# -- Environment variables --
# GNU Radio required variables
# TODO: Check if these are still required
export LD_LIBRARY_PATH=/usr/lib/libreoffice/program:/usr/lib/x86_64-linux-gnu/:/usr/local/lib/x86_64-linux-gnu/:$LD_LIBRARY_PATH
export PYTHONPATH=/usr/lib/python3/dist-packages:/usr/local/lib/python3.8/dist-packages/:$PYTHONPATH

# Python path
export PYTHONPATH=/usr/local/lib/python3/dist-packages:$PYTHONPATH

export STOW_DIR=/usr/local/stow

if [ -r "$HOME/.cargo/env" ]; then
    source "$HOME/.cargo/env"
fi

# Configure java environment
JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
if [ -d $JAVA_HOME ]; then
    export JAVA_HOME
    export PATH=$PATH:$JAVA_HOME/bin
fi
