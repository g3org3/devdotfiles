export DROPBOX=~/Dropbox
export ORG=${DROPBOX}/Org    # Org-mode home


# virtualenv
export PROJECT_HOME=/home/rodelrod/code
export WORKON_HOME=$HOME/.virtualenvs
# the following 2 lines are probably not necessary with pyenv-virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3  # points to system python even inside tmux
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh


# pyenv
export PATH="/home/rodelrod/.pyenv/bin:$PATH"
eval "$(pyenv init -)"


# search for snap executables
export PATH="/snap/bin:$PATH"


# rust
export PATH="$HOME/.cargo/bin:$PATH"
source "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Starship Prompt (requires nerd fonts installed)
eval "$(starship init bash)"

# direnv: must appear after rvm, git-prompt and other shell extensions that manipulate the prompt.
eval "$(direnv hook bash)"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/rodelrod/.sdkman"
[[ -s "/home/rodelrod/.sdkman/bin/sdkman-init.sh" ]] && source "/home/rodelrod/.sdkman/bin/sdkman-init.sh"
