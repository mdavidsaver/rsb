#!/bin/sh
set -e -x

# Expect from env
#   ARCH - RTEMS arch (eg. i386 or powerpc)
#   VERSION - RTEMS series (eg. 4.9)
#   BSPS - comma seperated list of BSP names (eg. "pc386,pc586")

# extracted by build.sh
PATH="$PATH:${HOME}/.rtems/bin"

${ARCH}-rtems${VERSION}-gcc --version

final_result=0
fail() {
  echo "$1"
  final_result=1
}

found_bsps=
for bsp in $(echo "$BSPS"|tr ',' ' ')
do
  echo "Test BSP $bsp"
  [ -f "$HOME/.rtems/${ARCH}-rtems${VERSION}/${bsp}/Makefile.inc" ] || \
  fail "Missing Makefile.inc"

  found_bsps=yes
done

[ "$found_bsps" ] || fail "No BSPs found"

exit $final_result
