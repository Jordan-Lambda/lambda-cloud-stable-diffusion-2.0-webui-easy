#!/bin/bash

# Switches the "Cloud IDE" link / tunnel back to the default JupyterLab.
# See lambda-tunnel-switcheroo.sh for more info

# The port our Lambda Cloud JupyterLab instance listens to by default.
jupyterlab_port=7000

script_dir="$(dirname $(readlink -f "\$0"))"

cd "$script_dir"
./lambda-tunnel-switcheroo.sh "$jupyterlab_port"
