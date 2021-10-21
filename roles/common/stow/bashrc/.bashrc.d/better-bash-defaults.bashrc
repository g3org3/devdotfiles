# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
shopt -s globstar

# include hidden files in glob expansion
shopt -s dotglob

# Disable CTRL-s (scroll lock), which opens this key up for i-search on
# bash and "open split" on Vim's CtrlP. It also prevents accidental freeze
# of the terminal (which you could exit with CTRL-q, but can still be a
# bit bewildering).
stty -ixon

