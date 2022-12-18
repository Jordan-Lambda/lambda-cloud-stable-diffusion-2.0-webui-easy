#!/bin/bash

set -ex

sudo docker compose --profile download up --build

sd_2_1_dir=data/StableDiffusion/v2.1/
sudo mkdir -p "$sd_2_1_dir"

echo -e "\n\n Downloading Stable Diffusion 2.1 checkpoints, for both 512x512 and 768x768.\n"
sudo wget -c https://huggingface.co/stabilityai/stable-diffusion-2-1/blob/main/v2-1_768-ema-pruned.ckpt -O "$sd_2_1_dir"v2-1_768-ema-pruned.ckpt
sudo wget -c https://huggingface.co/stabilityai/stable-diffusion-2-1-base/blob/main/v2-1_512-ema-pruned.ckpt -O "$sd_2_1_dir"v2-1_512-ema-pruned.ckpt


# The v2-inference.yaml config works for 2.1 as well as 2, and is the same for the 512 and 768 checkpoints.
# So download it once, and then make sylinks to the single download
sudo wget -c https://raw.githubusercontent.com/Stability-AI/stablediffusion/main/configs/stable-diffusion/v2-inference.yaml -O "$sd_2_1_dir"v2-inference.yaml

sudo ln -s "$sd_2_1_dir"v2-inference.yaml "$sd_2_1_dir"v2-1_512-ema-pruned.yaml
sudo ln -s "$sd_2_1_dir"v2-inference.yaml "$sd_2_1_dir"v2-1_768-ema-pruned.yaml

./switch_to_sd_webui.sh

sudo docker compose --profile auto up --build
