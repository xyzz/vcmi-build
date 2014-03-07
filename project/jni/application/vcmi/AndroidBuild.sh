#!/bin/sh

# With default -O3 optimization each G++ process eats 2Gb RAM, so tone optimization down to -O2, and limit make to two jobs
export AppFullName=is.xyz.vcmi.nightly
{ make -j4 2>&1 || exit 1 ; } | tee build.log
[ -f libapplication.so ] || exit 1
mv -f libapplication.so libapplication-armeabi-v7a.so

./set-version-prepare-cache.sh || exit 1

exit 0
