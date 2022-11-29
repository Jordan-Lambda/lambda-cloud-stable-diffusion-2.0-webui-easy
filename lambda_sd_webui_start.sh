#!/bin/bash

set -ex

sudo docker compose --profile download up --build

./switch_to_sd_webui.sh

sudo docker compose --profile auto up --build
