#!/bin/sh
set -e

sed -i "s/var ip =.*/var ip = '${SERVERIP}'/g" /cellmapping-frontend/app/scripts/config.js

exec /usr/local/bin/pm2-docker start /pm2.json