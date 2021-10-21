# Wrap aliases so that they can still use completion
source ~/.bashrc.d/complete-alias/complete_alias

# Rod's shortcuts
alias ta="tmux attach-session -t"
complete -F _complete_alias ta         # wrap alias to preserve completion
alias dc="docker-compose"              # not worth wrapping, no completion in the original command
alias dusage="du -h --max-depth=1"                            # One-level disk usage
alias vimlight="vim --noplugin -c 'syntax off'"             # For gigantic files like SQL dumps
alias tstamp='date +%Y%m%dT%H%M%S%Z'   # use this to timestamp file names
function prettyjson() { cat "$1" | python -m json.tool; }
