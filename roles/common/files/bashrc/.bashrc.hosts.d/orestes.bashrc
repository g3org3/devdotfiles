# virtualenv
export PROJECT_HOME=/home/rodelrod/code
export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python  # points to system python even inside tmux
source /usr/local/bin/virtualenvwrapper.sh

# go
export GOPATH=$HOME/code/go

alias ctags-update="ctags -R --fields=+l --languages=python --python-kinds=-iv -f ./tags \$(python -c \"import os, sys; print(' '.join('{}'.format(d) for d in sys.path if os.path.isdir(d)))\")"

# awsebcli
#export PATH="/home/rodelrod/.local/bin:$PATH"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
pyenv virtualenvwrapper_lazy

# search for snap executables
export PATH="/snap/bin:$PATH"


#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/rodelrod/.sdkman"
[[ -s "/home/rodelrod/.sdkman/bin/sdkman-init.sh" ]] && source "/home/rodelrod/.sdkman/bin/sdkman-init.sh"
