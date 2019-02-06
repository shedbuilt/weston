#!/bin/bash
if [ -e /etc/sysconfig/createfiles ] && grep -Fq "/run/shm/wayland" /etc/sysconfig/createfiles; then
    echo "Updating Weston's socket/lock file directory in /etc/sysconfig/createfiles."
    sed -i "s/\/run\/shm\/wayland .*/\/run\/shm\/wayland dir 1700 root root/" /etc/sysconfig/createfiles || exit 1
else
    echo "Adding an entry for Weston's socket/lock file directory in /etc/sysconfig/createfiles."
    echo "/run/shm/wayland dir 1700 root root" >> /etc/sysconfig/createfiles || exit 1
fi
