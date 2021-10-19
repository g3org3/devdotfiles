#!/bin/bash

export DISCLAIMER="# auto-generated by init.sh"
STEP=${1:-}

GREEN="\033[0;32m"
RED="\033[0;31m"
BLUE="\033[0;34m"
YELLOW="\033[0;33m"
NC="\033[0m"

read -r -p "Is this machine \`$(hostname)\` a DBG machine? [y/N] " response
response=${response,,} # tolower
IS_DBG=false
if [[ "$response" =~ ^(yes|y)$ ]]; then
  IS_DBG=
fi


#### START DBG-ONLY Section
if [[ $IS_DBG = "YES" ]]; then
  ## Configure proxy in ~/.bashrc for curl and other commands
  GENERATED_LINES_FOUND=$(cat ~/.bashrc | grep init.sh | wc -l)
  if [[ "$GENERATED_LINES_FOUND" = "5" ]]; then
    echo -e "\n## [0] Appending env variables and aliases to  ~/.bashrc [${YELLOW}skipped${NC}]"
  else
    echo -e "\n## [0] Appending env variables and aliases to  ~/.bashrc"
    echo "export http_proxy=http://webproxy.deutsche-boerse.de:8080 $DISCLAIMER" >> ~/.bashrc
    echo "export https_proxy=http://webproxy.deutsche-boerse.de:8080 $DISCLAIMER" >> ~/.bashrc
    echo "export HTTP_PROXY=http://webproxy.deutsche-boerse.de:8080 $DISCLAIMER" >> ~/.bashrc
    echo "export HTTPS_PROXY=http://webproxy.deutsche-boerse.de:8080 $DISCLAIMER" >> ~/.bashrc
    echo "export no_proxy=*.deutsche-boerse.de $DISCLAIMER" >> ~/.bashrc
  fi
  . ~/.bashrc

  ## Configure the git/ssh proxy for GITHUB/GITLAB
  CONFIGURE_SSH_CONFIG="YES"
  if [[ -f ~/.ssh/config ]]; then
    read -r -p "$( echo -e "\n  ~/.ssh/config ${GREEN}already exists${NC}\n  Do you wish to append the proxy config? [y/N] ")" response
    response=${response,,} # tolower
    if [[ ! "$response" =~ ^(yes|y)$ ]]; then
      CONFIGURE_SSH_CONFIG=""
    fi
  fi
  if [[ "$CONFIGURE_SSH_CONFIG" = "YES" ]]; then
    echo -e "\n## [0] Configuring the proxy on your ssh to clone git repos"
    echo "host github.com" >> ~/.ssh/config
    echo "	hostname ssh.github.com" >> ~/.ssh/config
    echo "	user git" >> ~/.ssh/config
    echo "	port 443" >> ~/.ssh/config
    echo "	proxycommand socat - PROXY:webproxy.deutsche-boerse.de:%h:%p,proxyport=8080" >> ~/.ssh/config
    ## Configure the git/ssh proxy for GITLAB
    echo "host gitlab.com" >> ~/.ssh/config
    echo "	hostname altssh.gitlab.com" >> ~/.ssh/config
    echo "	user git" >> ~/.ssh/config
    echo "	port 443" >> ~/.ssh/config
    echo "	proxycommand socat - PROXY:webproxy.deutsche-boerse.de:%h:%p,proxyport=8080" >> ~/.ssh/config
  else
    echo -e "\n## [0] Configuring the proxy on your ssh to clone git repos [${YELLOW}skipped${NC}]"
  fi
fi
#### END DBG-ONLY Section


## Installing useful stuff
if [[ "$STEP" = "1" ]] || [[ -z "$STEP" ]]; then
  SOCAT_PATH=$(which socat)
  MAKE_PATH=$(which make)
  GIT_PATH=$(which git)
  if [[ -z "$SOCAT_PATH" || -z "$MAKE_PATH" || -z "$GIT_PATH" ]]; then
    echo -e "\n## [1] Installing socat, make and git\n"
    sudo apt install socat make git -y
  else
    echo -e "\n## [1] Installing socat, make and git [${YELLOW}skipped${NC}]"
  fi
fi


## Create a new ssh key
if [[ "$STEP" = "2" ]] || [[ -z "$STEP" ]]; then
  if [[ -f ~/.ssh/id_rsa.pub ]]; then
    echo -e "\n## [2] Creating a new ssh key [${YELLOW}skipped${NC}]\n"
  else
    echo -e "\n## [2] Creating a new ssh key"
    ssh-keygen -t rsa
  fi
fi


## Open github and register the new key
if [[ "$STEP" = "2.5" ]] || [[ -z "$STEP" ]]; then
  read -r -p "  Do you wish to copy your public key and open github.com? [Y/n] " response
  response=${response,,} # tolower
  if [[ ! "$response" =~ ^(no|n)$ ]]; then
    echo -e "\n  ## [2.5] Open github and register your new ssh key\n"
    read -r -p "  ### press enter to copy your public key to your clipboard... "
    cat ~/.ssh/id_rsa.pub | xclip -i -selection clipboard
    read -r -p "  ### press enter to open firefox with github... "
    xdg-open https://github.com/settings/keys > /dev/null
    read -r -p "  ### press enter when you finish registering your key... "
  else
    echo -e "\n  ## [2.5] Open github and register your new ssh key [${YELLOW}skipped${NC}]\n"
  fi
fi


## Git cloning the dotfiles repo
if [[ "$STEP" = "3" ]] || [[ -z "$STEP" ]]; then
  if [[ -d ~/.dotfiles ]]; then
    echo -e "\n## [3] Git cloning the dotfiles repo [${YELLOW}skipped${NC}]"
  else
    echo -e "\n## [3] Git cloning the dotfiles repo"
    git clone --depth=1 --recurse-submodules git@github.com:rodelrod/dotfiles.git ~/.dotfiles
  fi
fi


## Creating your host bashrc in the repo
if [[ "$STEP" = "4" || -z "$STEP" ]]; then
  HOST_BASHRC_FILE_PATH="$HOME/.dotfiles/roles/common/stow/bashrc/.bashrc.hosts.d/$(hostname).bashrc"
  if [[ ! -f "$HOST_BASHRC_FILE_PATH" ]]; then
    echo -e "\n## [4] Creating an empty host bashrc in the git repo [roles/common/stow]"
    touch "$HOST_BASHRC_FILE_PATH"
  else 
    echo -e "\n## [4] Creating an empty host bashrc in the git repo [roles/common/stow] [${YELLOW}skipped${NC}]"
  fi
fi


## Done
echo ""
