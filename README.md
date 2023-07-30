# Introduction
Ready to use assetto corsa server with basic track and BMW M3 e30  
You can pull the docker image and use the included docker-compose.yml to start your assetto corsa server, locally or cloud hosted  

This server is customisable  

# Port Forwarding
The following ports need to be forwarded on your router and or firewall  
Port 8081 HTTP (or tcp) ##TODO Make these ports customisbale form the docker-compose.yml  
Port 9600 tcp and udp  ##TODO Make these ports customisbale form the docker-compose.yml  

# Getting Started
Get image from dockerhub `docker pull NEoKhajitt/assetto-corsa-server:latest`
Use `docker-compose.yaml` from this repo

At bare minimum update the `STEAM_USER` and `STEAM_PASSWORD` in the docker-compose file  
Additionally you can update the `SERVER_NAME`, `SERVER_PASSWORD` and `ADMIN_SERVER_PASSWORD`
`SERVER_NAME` - Will be your globally displayed name in AC Content Manager
`SERVER_PASSWORD` - Is optional unless you dont want anyone to join your server randomly
`ADMIN_SERVER_PASSWORD` - Should be set, and preferably not the same as the `SERVER_PASSWORD`  

After this is all in place, run `docker-compose up -d` and you should have a running assetto-corsa-server searchable on your public ip address (at this time, AC Content Manager does not support dns names)  

# Customising
After the initial server start the config and basic contents would be mounted to your docker host  
In your mounted directory (if kept the same form docker-compose.yaml) eg. `./acserver/serverfiles/`
You will have the `content` directory with `cars` and `tracks`  
Download the car packs and track packs you want for your server and unzip them over your `content` directory essentially replacing or adding cars and track you dont have  

<details>
<summary>Cars</summary>

#### Cars
Once done, you can get the name of the car you want based on it's directory name eg. `ks_audi_r18_etron_quattro`
Add this name in a semicolon `;` separate format in `./acserver/serverfiles/cfg/acserver.cfg` under the `[SERVER]` `CARS=`  property like below:
```
[SERVER]
NAME="YOURSERVER"
CARS=bmw_m3_e30;ks_audi_r18_etron_quattro
```
NOTE! When adding a list of car names here, your server will show them but wont be available for use (no slots available message)  

You need to add the cars to `./acserver/serverfiles/cfg/entry_list.ini` in the following format:
```
[CAR_0]
MODEL=bmw_m3_e30
SKIN=alpine_white_I
SPECTATOR_MODE=0
DRIVERNAME=
TEAM=
GUID=
BALLAST=

[CAR_1]
MODEL=ks_audi_r18_etron_quattro
SKIN=00_lm2
SPECTATOR_MODE=0
DRIVERNAME=
TEAM=
GUID=
BALLAST=0
```
Each car you add, increase the intiger id eg. [CAR_0] then [CAR_1] then [CAR_2] etc.  
The `MODEL` will match the directory name the as in the `acserver.cfg`, but the `SKIN` name should be found in the `content/cars/ks_audi_r18_etron_quattro/skins` directory, the name of the `SKIN` should be the name of the directory eg. `00_lm1` or `01_lm2`

This will enable the cars on your server
If you want multiple of the same car, just duplicate each car and update the intiger id, so you can eg. have 5 of the exact same car and skin duplicates as long as it read `CAR_0`, `CAR_1`, `CAR_2`, `CAR_4`, `CAR_5`

NOTE! I came across an issue where I added a car `hw_DragCamaro_1` just as its directory was named, the server would show the car as available, but when loading in a session you would get instakicked `"no slots available"`, in a case like this where your car resources have uppercase letter in it's name (don't rename anything!) simply specify the name in lower case in your `acserver.cfg` and `entry_list.ini` eg. 
```
[CAR_6]
MODEL=hw_dragcamaro_1
SKIN=black
SPECTATOR_MODE=0
DRIVERNAME=
TEAM=
GUID=
BALLAST=0
```

ADDTIONAL NOTE! the number of available cars are capped at the number of `MAX_CLIENTS` in `acserver.cfg`
So if you add 10 cars and your `MAX_CLIENTS` is set to 6 eg. `MAX_CLIENTS=6` only the first 6 cards in your `entry_list.ini` would be available for use, so rather set your `MAX_CLIENTS` at a hight number

</details>

<details>
<summary>Track</summary>

#### Track
To update the track, in `./acserver/serverfiles/cfg/acserver.cfg` under the `[SERVER]` `TRACK=`  property like below:
```
[SERVER]
NAME=
CARS=bmw_m3_e30
CONFIG_TRACK=
TRACK=magione
```
When adding new tracks to your `content/track` directory, you can select the track using the directory name in the config above.
If you have a track eg. `content/track/ks_drag` in the under `[SERVER]` `TRACK=` you will use `ks_drag` and your track is all set

</details>

<details>
<summary>Running Multiple Servers</summary>
## TODO Update docker-compose.yaml so accomodate multiple server config but single content directory
</details>