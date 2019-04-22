#!/bin/bash
set -e

# run this as follows
# arguments should be what you want to left
# ./volume-cleanup.sh "$(< file.txt)"
# ./volume-cleanup.sh test-volume-1 test-volume-2

for volume in $@; do
  mountpoint=$(docker inspect $volume --format "{{.Options.mountpoint}}")
  echo "$volume || $mountpoint"

  read -p "Are you sure to delete? " -n 1 -r
  echo    # (optional) move to a new line
  if [[ $REPLY =~ ^[Yy]$ ]]
  then
    docker volume rm -f $volume && [[ -d $mountpoint ]] && rm -rf $mountpoint
  fi
done
