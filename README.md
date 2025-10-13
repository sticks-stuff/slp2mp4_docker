# slp2mp4
To use first install Docker, then run 
```
docker compose build --no-cache
```
to build the container from scratch for your machine

use
```
docker compose up [-d]
```
to begin hosting @ {yourhostname}:3502

make sure the replay files are in the ./config/SlippiReplays/ folder that you'd like to convert

make sure the ./config/.slp2mp4.toml is adjusted to your liking. The largest impact on performance will be the number of instances available (setting to 0 will default to the max which is not reccomended) and the bitrate of the recording.

once you have completed the above starter steps log into the rendering computer to initialize the xserver by going to {yourhostname}:3502 in the browser and trust the self signed certificate. Right click the desktop anywhere and click convert2mp4. The rendering computer will begin spitting out mp4s to the ./config/ directory and there is a script included for moving them to a desired location(NAS)

# TODO 

Implement mainline

More output modes
