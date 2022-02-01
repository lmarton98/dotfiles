#!/bin/bash

REMOTE="https://github.com/lmarton98/dotfiles"

TMPDIR=tmpdotfiles
GITDIR=$HOME/.dotfiles
BACKUP_SUFFIX=.dfbackup

# Clone the repo to a tmp dir
git clone --separate-git-dir=$GITDIR $REMOTE $TMPDIR

# Copy dotfiles to HOME, but create backups of overwritten files
shopt -s dotglob
cp -r --backup=simple --suffix=$BACKUP_SUFFIX $TMPDIR/* $HOME/

# Cleanup HOME 1: remove git folder pointer file
rm $HOME/.git

# Cleanup HOME 2: move backup files elsewhere
mkdir -p $GITDIR/backup
mv $HOME/*$BACKUP_SUFFIX $GITDIR/backup/

# Cleanup HOME 3: remove tmp dir used for cloning
rm -r $TMPDIR

# Activate fresh configuration
source $HOME/.bash_profile

# Ignore untracked files in dotfiles repo
dotfiles config --local status.showUntrackedFiles no

# Configure user email for dotfiles repo
dotfiles config --local user.email lmarton98@gmail.com
