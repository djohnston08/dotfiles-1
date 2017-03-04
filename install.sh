#!/usr/bin/env bash

###########################
# This script installs the dotfiles and runs all other system configuration scripts
# @author djohnston
# Inspired by Adam Eivy using his bot command and general template
###########################

# include my library helpers for colorized echo and require_brew, etc
source ./lib_sh/echos.sh

bot "Hi! I'm going to install tooling and tweak your system settings. Here I go..."

# set zsh as the user login shell
CURRENTSHELL=$(echo $SHELL)
if [[ "$CURRENTSHELL" != "/usr/bin/zsh" ]]; then
  bot "setting zsh (/usr/bin/zsh) as your shell (password required)"
  which zsh > /dev/null 2>&1
  if (( $? != 0 )); then
      sudo apt install zsh
  fi
  chsh -s /usr/bin/zsh
  ok
fi

if [[ ! -d "./oh-my-zsh/custom/themes/powerlevel9k" ]]; then
  git clone https://github.com/bhilburn/powerlevel9k.git oh-my-zsh/custom/themes/powerlevel9k
fi

bot "creating symlinks for project dotfiles..."
pushd homedir > /dev/null 2>&1
now=$(date +"%Y.%m.%d.%H.%M.%S")

for file in .*; do
  if [[ $file == "." || $file == ".." ]]; then
    continue
  fi
  running "~/$file"
  # if the file exists:
  if [[ -e ~/$file ]]; then
      mkdir -p ~/.dotfiles_backup/$now
      mv ~/$file ~/.dotfiles_backup/$now/$file
      echo "backup saved as ~/.dotfiles_backup/$now/$file"
  fi
  # symlink might still exist
  unlink ~/$file > /dev/null 2>&1
  # create the link
  ln -s ~/.dotfiles/homedir/$file ~/$file
  echo -en '\tlinked';ok
done

popd > /dev/null 2>&1

# always pin versions (no surprises, consistent dev/build machines)
npm config set save-exact true

#####################################
# Now we can switch to node.js mode
# for better maintainability and
# easier configuration via
# JSON files and inquirer prompts
#####################################

bot "installing npm tools needed to run this project..."
npm install
ok

# bot "installing packages from config.js..."
# node index.js
# ok

# running "cleanup homebrew"
# brew cleanup > /dev/null 2>&1
# ok

bot "Setting oh-my-zsh to use our custom git plugin..."
if [ ! -d ~/.dotfiles/oh-my-zsh/custom/plugins/git ]; then
    cp -pR ~/.dotfiles/plugins/git ~/.dotfiles/oh-my-zsh/custom/plugins/
fi

bot "Woot! All done. Kill this terminal and launch iTerm.  You may also reboot to guarantee everything has updated."
