# Stop the constant LD_PRELOAD errors, hoping that this does not break Citrix
export LD_PRELOAD=""

# /usr/local/bin is not in PATH in Azure Ubuntu VDI as it is in plain Ubuntu
# This is namely necessary for Starship
export PATH="$PATH:/usr/local/bin"
