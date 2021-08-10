#!/bin/bash

# -----------------------------------------------------------------------------
# STATUS.SH
# -----------------------------------------------------------------------------
set -e
source $INSTALLER/000_source

# -----------------------------------------------------------------------------
# INIT
# -----------------------------------------------------------------------------
[[ "$DONT_RUN_STATUS" = true ]] && exit

echo
echo "------------------------- STATUS --------------------------"

# -----------------------------------------------------------------------------
# SHOW STATUS
# -----------------------------------------------------------------------------
# network
ip addr
echo

# LXC containers
lxc-ls -f
echo
