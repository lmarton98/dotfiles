# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Source shell dotfiles
for file in ~/.{path,bash_prompt,exports,aliases,functions,extras}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
unset file

# History
shopt -s histappend

# Set Bash to save each command to history, right after it has been executed.
prompt() {
  history -a
}
PROMPT_COMMAND=prompt

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# Save multi-line commands in one history entry.
shopt -s cmdhist

# Automatically fix directory name typos when changing directory.
shopt -s cdspell

# Automatically expand directory globs and fix directory name typos whilst completing.
shopt -s direxpand dirspell

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Allow dotfiles to be included in filename expansion
shopt -s dotglob

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
