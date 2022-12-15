#!/bin/bash

# Switches the "Cloud IDE" link / tunnel to the webui service.
# See lambda-tunnel-switcheroo.sh for more info

# The port that the webui (docker container) listens to by default.
sd_webui_port=7860

script_dir="$(dirname $(readlink -f "\$0"))"

cd "$script_dir"
./lambda-tunnel-switcheroo.sh "$sd_webui_port"
