export DROPBOX=~/Dropbox

# virtualenv
export PROJECT_HOME=/home/rodelrod/code
export WORKON_HOME=$HOME/.virtualenvs
# the following 2 lines are probably not necessary with pyenv-virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3  # points to system python even inside tmux
source /usr/share/virtualenvwrapper/virtualenvwrapper.sh

# search for snap executables
export PATH="/snap/bin:$PATH"

# rust
export PATH="$HOME/.cargo/bin:$PATH"
source "$HOME/.cargo/env"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
