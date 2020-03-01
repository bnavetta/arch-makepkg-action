#!/bin/bash
set -eou pipefail

if [[ ! -z "$1" ]]; then
    cd "$1"
fi

echo "Running makepkg from $PWD"
chown -R archbuilder "$PWD"

# TODO: support extra flags

su archbuilder -c makepkg

namcap -i *.pkg.tar.xz
