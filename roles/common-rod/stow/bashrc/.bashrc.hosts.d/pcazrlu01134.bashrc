export ORG=~/org    # Org-mode home


# DBG Proxy for the command line
export http_proxy=http://webproxy.deutsche-boerse.de:8080
export https_proxy=http://webproxy.deutsche-boerse.de:8080
export no_proxy=*.deutsche-boerse.de

# Stop the constant LD_PRELOAD errors, hoping that this does not break Citrix
export LD_PRELOAD=""


# pyenv
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# direnv: must appear after rvm, git-prompt and other shell extensions that manipulate the prompt.
eval "$(direnv hook bash)"

# added by pipx (https://github.com/pipxproject/pipx)
export PATH="/home/OAAD/ht295/.local/bin:$PATH"

# /usr/local/bin is not in PATH in Marlene, we need it for starship
export PATH="$PATH:/usr/local/bin"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
