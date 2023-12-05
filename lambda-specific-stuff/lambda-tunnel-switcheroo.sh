#!/bin/bash

# This script was only designed to be run on Lambda Cloud on-demand instances.

# Usage: ./lambda-tunnel-switcheroo.sh new_port
# Where new_port should be the port that a service is listening to.

# For example, if you have an apache http server listening on port 80 and you want that to serve its pages through the "Cloud IDE" link instead of serving the JupyterLab Cloud IDE, you could run:
# ./lambda-tunnel-switcheroo.sh 80

# Whatever service you run must be listening for http, *not* https, connections on the given port.
# The cloudflared tunnel will then add secure https / http3 support.

# If you do configure a service to listen to outside connections, you will be hosting a an insecure http web service on the public internet. Therefore:

# *****************
# SECURITY WARNING: Do not configure your service to listen to any address other than localhost!
# *****************

if [[ "$1" =~ ^[0-9]+$ ]]; then
	new_port="$1"
else
	echo "new_port must be a port number. You passed in: $1"
	echo "Exiting without making any changes."
	exit 1
fi

# Change the port that cloudflared listens to
sudo sed -i 's#http://localhost:[[:digit:]]\+#http://localhost:'"${new_port}#" /etc/cloudflared/config.yml

if [[ "$?" -eq 0 ]]; then
	sudo systemctl restart cloudflared.service

	echo "Success, now the \"Cloud IDE\" link in your dashboard will take you to the service that (hopefully) is listening on port ${new_port}."
else
	echo "Sorry, something went wrong. For support, please email support@lambdal.com and include all output from this script in your message."
	echo "Here is the current contents of /etc/cloudflared/config.yml:"
	echo
	cat /etc/cloudflared/config.yml

	exit 2
fi
