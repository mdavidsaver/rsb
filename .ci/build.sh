#!/bin/sh
set -e -x

# Expect from env
#   ARCH - RTEMS arch (eg. i386 or powerpc)
#   VERSION - RTEMS series (eg. 4.9)
#   BSPS - comma seperated list of BSP names (eg. "pc386,pc586")

env

(cd source-builder && ./sb-check)

cd rtems

../source-builder/sb-set-builder \
 --log log --no-install --bset-tar-file \
 --prefix "${HOME}/.rtems" \
 --with-rtemsbsp=${BSPS} ${VERSION}/rtems-${ARCH}.bset

mv tar/*rtems*kernel*.tar.bz2 tar/output.tar.bz2

# test extract
tar -C / -xamf tar/output.tar.bz2

PATH="$PATH:${HOME}/.rtems/bin"

${ARCH}-rtems${VERSION}-gcc --version

if [ "${TRAVIS_TAG}" ]
then
    mv tar/output.tar.bz2 ../${ARCH}-rtems${VERSION}-${DIST}-${TRAVIS_TAG}.tar.bz2
else
    mv tar/output.tar.bz2 ../${ARCH}-rtems${VERSION}-${DIST}-latest.tar.bz2
fi
