#!/bin/bash

# ------------------------------------------------------------------------------
# SOURCE.SH
# ------------------------------------------------------------------------------
set -e
SOURCE=$INSTALLER/000-source

# ------------------------------------------------------------------------------
# INIT
# ------------------------------------------------------------------------------
echo
echo "-------------------------- SOURCE -------------------------"

# ------------------------------------------------------------------------------
# PRE-SOURCE PACKAGES
# ------------------------------------------------------------------------------
export DEBIAN_FRONTEND=noninteractive
dnf install -y epel-release
dnf install -y dpkg
dnf $APT_PROXY -y install procps

# ------------------------------------------------------------------------------
# SET GLOBAL VARIABLES
# ------------------------------------------------------------------------------
# Architecture
ARCH=$(dpkg --print-architecture)
echo "export ARCH=$ARCH" >> $SOURCE

# RAM capacity
RAM=$(free -m | grep Mem: | awk '{ print $2 }')
echo "export RAM=$RAM" >> $SOURCE

# Is the host in an LXC container?
[[ "$(stat -c '%i' /)" -gt 1000 ]] && \
    echo "export IS_IN_LXC=true" >> $SOURCE

[[ -z "$TIMEZONE" ]] && \
    echo "export TIMEZONE=$(cat /etc/timezone)" >> $SOURCE

# always return true
true
