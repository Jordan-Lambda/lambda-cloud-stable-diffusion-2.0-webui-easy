# Honestly, this has been made mostly obsolete by Lambda's "Demos" feature.

I recommend using that instead, instructions here: https://lambdalabs.com/blog/host-stable-diffusion-with-lambda-demos-in-just-a-few-clicks


## One liner setup of Stable Diffusion Web UI for a Lambda Cloud instance

A fully automated script to go from a new Lambda Cloud instance to the AUTOMATIC111 stable diffusion webui, with Stable Diffusion 1.5 and 2.1.

If you've alredy cloned this git repo into a Lambda instance, then simply run `./lambda_sd_webui_start.sh` then click the "Cloud IDE" link for your instance.

If you have nothing but a fresh Lambda Cloud instance, then run this:
```
git clone https://github.com/Jordan-Lambda/lambda-cloud-stable-diffusion-2.0-webui-easy.git && cd lambda-cloud-stable-diffusion-2.0-webui-easy/ && lambda-specific-stuff/lambda_sd_webui_start.sh
```

And then click the "Cloud IDE" link for your instance.

Thank you to https://github.com/AbdBarho/stable-diffusion-webui-docker and https://github.com/AUTOMATIC1111/stable-diffusion-webui for doing the hard parts that this script depends on.
