#!/bin/sh
set -e

for ff in rtems/log rtems/*.txt
do
  echo "Log $ff"
  tail -n 200 "$ff"
done
