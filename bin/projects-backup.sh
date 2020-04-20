#!/usr/bin/env bash

set -e # always immediately exit upon error

# directory config. ending slashes are important!
src_dir="$HOME/projects/"
dest_dir="$HOME/Dropbox/projects-backup/"

# run the sync
rsync -ar --delete \
  --filter=':- .gitignore' \
  --exclude='node_modules' \
  --exclude='.git' \
  --exclude='.DS_Store' \
  --chmod='F-w' \
  "$src_dir" "$dest_dir"
