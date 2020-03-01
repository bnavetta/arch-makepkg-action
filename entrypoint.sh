#!/bin/bash
set -eou pipefail

if [[ ! -z "$1" ]]; then
    cd "$1"
fi

echo "Running makepkg from $PWD"

pkg_deps=$(source ./PKGBUILD && echo $makedepends[@] $depends[@])
echo "Installing dependencies: $pkg_deps"
pacman -Syu $pkg_deps

chown -R archbuilder "$PWD"

# TODO: support extra flags

su archbuilder -c makepkg -f

namcap -i *.pkg.tar.xz
