# Easy access to Doom emacs cli tools
export PATH="$PATH:$HOME/.emacs-profiles/doom-emacs/bin"

# Run magit from terminal
alias magit='emacsclient -nw -e "(progn (magit-status) (delete-other-windows))"'
