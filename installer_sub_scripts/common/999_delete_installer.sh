#!/bin/bash

# -----------------------------------------------------------------------------
# DELETE_INSTALLER.SH
# -----------------------------------------------------------------------------
set -e
source $INSTALLER/000_source

# -----------------------------------------------------------------------------
# INIT
# -----------------------------------------------------------------------------
[[ "$DONT_RUN_DELETE_INSTALLER" = true ]] && exit

# -----------------------------------------------------------------------------
# REMOVE
# -----------------------------------------------------------------------------
# remove the git local repo.
cd $BASEDIR
rm -rf $TMP
