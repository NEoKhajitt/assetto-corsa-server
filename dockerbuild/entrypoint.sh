#!/bin/bash

if [ -z "$(ls -A /home/acserver/)" ]; then
   cp -r  /tmp/acserver/. /home/acserver/
fi


sed -i "s/steamuser.*/steamuser=$STEAM_USER/" /home/acserver/lgsm/config-lgsm/acserver/common.cfg
sed -i "s/steampass.*/steampass=$STEAM_PASSWORD/" /home/acserver/lgsm/config-lgsm/acserver/common.cfg
sed -i "2s/NAME=.*/NAME=$SERVER_NAME/" /home/acserver/serverfiles/cfg/acserver.cfg
sed -i "7s/PASSWORD=.*/PASSWORD=$SERVER_PASSWORD/" /home/acserver/serverfiles/cfg/acserver.cfg
sed -i "8s/ADMIN_PASSWORD=.*/ADMIN_PASSWORD=$ADMIN_SERVER_PASSWORD/" /home/acserver/serverfiles/cfg/acserver.cfg

/home/acserver/acserver start && tail -f /dev/null
