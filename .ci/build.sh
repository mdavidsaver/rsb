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
 --with-rtems \
 --with-rtemsbsp=${BSPS} \
 ${VERSION}/rtems-${ARCH}.bset

mv tar/*rtems*kernel*.tar.bz2 tar/output.tar.bz2

# extract for use by test.sh
tar -C / -xvamf tar/output.tar.bz2


# deploy picks up all *.tar.* in top source directory

[ "${TRAVIS_TAG}" ] || TRAVIS_TAG=latest

mv tar/output.tar.bz2 ../${ARCH}-rtems${VERSION}-${DIST}-${TRAVIS_TAG}.tar.bz2

if [ "${ARCH}" = "i386" ]
then
    # designate i386 build to produce the sources tar
    # assumed to be the same for all archs, though downloaded seperatly
    tar -cavf ../rtems${VERSION}-sources-${TRAVIS_TAG}.tar.gz sources patches
fi
