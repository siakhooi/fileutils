#!/usr/bin/env bash
#
# Description: Build Linux packages from the source files.
# Usage: ./build-packages.sh [options]
#

set -euo pipefail

# ===== Source =====
# shellcheck disable=SC1091
. ./release.env
# shellcheck disable=SC1091
. ./build.env
mkdir -p target/deb
PREFIX=/usr nfpm pkg --packager deb --target target/deb/
mkdir -p target/rpm
PREFIX=/usr nfpm pkg --packager rpm --target target/rpm/
mkdir -p target/termux
PREFIX=/data/data/com.termux/files/usr nfpm pkg --packager deb --target target/termux/
echo '[Linux-Deb]'
find target/deb -name '*.deb' -exec dpkg-deb --contents {} \;
echo '[Linux-RPM]'
find target/rpm -name '*.rpm' -exec rpm -qpl {} --dbpath /tmp/rpmdb \;
echo '[Termux-Deb]'
find target/termux -name '*.deb' -exec dpkg-deb --contents {} \;
