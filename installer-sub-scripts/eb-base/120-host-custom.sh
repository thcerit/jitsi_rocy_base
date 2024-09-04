#!/bin/bash

# ------------------------------------------------------------------------------
# HOST_CUSTOM.SH
# ------------------------------------------------------------------------------
set -e
source $INSTALLER/000-source

# ------------------------------------------------------------------------------
# ENVIRONMENT
# ------------------------------------------------------------------------------
MACH="$TAG-host"
cd $MACHINES/$MACH

# ------------------------------------------------------------------------------
# INIT
# ------------------------------------------------------------------------------
[[ "$DONT_RUN_HOST_CUSTOM" = true ]] && exit

echo
echo "---------------------- HOST CUSTOM ------------------------"

# ------------------------------------------------------------------------------
# PACKAGES
# ------------------------------------------------------------------------------
export DEBIAN_FRONTEND=noninteractive

# upgrade
# dnf $APT_PROXY -y dist-upgrade
dnf $APT_PROXY -y upgrade

# added packages
dnf $APT_PROXY -y install zsh tmux vim autojump
dnf $APT_PROXY -y install htop iotop bmon bwm-ng
dnf $APT_PROXY -y install fping whois
dnf $APT_PROXY -y install net-tools ngrep nmap-ncat
dnf $APT_PROXY -y install rsync
dnf $APT_PROXY -y install bzip2 ack jq
dnf $APT_PROXY -y install rsyslog

# ------------------------------------------------------------------------------
# ROOT USER
# ------------------------------------------------------------------------------
# rc files
[[ ! -f "/root/.bashrc" ]] && cp root/.bashrc /root/ || true
[[ ! -f "/root/.vimrc" ]] && cp root/.vimrc /root/ || true
[[ ! -f "/root/.zshrc" ]] && cp root/.zshrc /root/ || true
[[ ! -f "/root/.tmux.conf" ]] && cp root/.tmux.conf /root/ || true
