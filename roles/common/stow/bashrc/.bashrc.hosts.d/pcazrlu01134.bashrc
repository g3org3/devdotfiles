# DBG Proxy for the command line
export http_proxy=http://webproxy.deutsche-boerse.de:8080
export https_proxy=http://webproxy.deutsche-boerse.de:8080
export no_proxy=*.deutsche-boerse.de

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
