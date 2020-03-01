#!/bin/bash
set -eou pipefail

if [[ ! -z "$1" ]]; then
    cd "$1"
fi

echo "Running makepkg from $PWD"

pkg_deps=$(source ./PKGBUILD && echo ${makedepends[@]} ${depends[@]})
echo "Installing dependencies: $pkg_deps"
pacman -Syu --noconfirm $pkg_deps

chown -R archbuilder "$PWD"

echo "Running makepkg"

# TODO: support extra flags

su archbuilder -c makepkg -f

echo "Running namcap"

namcap -i *.pkg.tar.xz
