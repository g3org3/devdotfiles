#!/bin/bash
#
# Signs kernel modules so that they are accepted by Secure Boot.
# This must be run after every kernel update.
#
# I should consider adding this to /etc/kernel/postinst.d. 
#
# However, I don't want to do it before I run it manually in prod.  Also, I
# have doubts that it will work without adaptation, since `uname` will probably
# return the old kernel name instead of the one being installed. 
# 
# One possible solution for this would be to use `kmodsign`. Another would be
# locate the kernel being installed.

if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root" 
   exit 1
fi

modules=(
# Virtualbox
vboxdrv
vboxnetflt
vboxnetadp
vboxpci
# TLP (Thinkpad-specific modules)
thinkpad_ec
tp_smapi
hdaps
acpi_call
)
for module in ${modules[@]}; do
    /usr/src/linux-headers-$(uname -r)/scripts/sign-file sha256 /root/mok.priv /root/mok.der $(modinfo -n $module)
done
