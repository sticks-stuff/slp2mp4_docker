based on dolphin-emu for docker, using dolphin ishiiruka and https://github.com/davisdude/slp2mp4 with some basic openbox config.

# slp2mp4
To use first install Docker, then clone this repo and run the following in the base directory
```
docker compose build --no-cache
```
To build the container from scratch for your machine

Use
```
docker compose up [-d]
```
To begin hosting @ {yourhostname}:3502

Make sure the replay files are in the ./config/SlippiReplays/ folder that you'd like to convert

Make sure the ./config/.slp2mp4.toml is adjusted to your liking. The largest impact on performance will be the number of instances available (setting to 0 will default to the max which is not reccomended) and the bitrate of the recording.

Once you have completed the above starter steps log into the rendering computer to initialize the xserver by going to {yourhostname}:3502 in the browser and trust the self signed certificate. 

for single games to mp4s, right click the desktop anywhere in the vm and click [filepath.slp -> filepath.mp4]. The rendering computer will begin spitting out mp4s to the ./config/ directory from the ./config/SlippiReplays/ directory

to encode sets of slp files into one mp4 per set make subfolders in the ./config/SlippiReplays/ directory with the naming convention foldername_set/ with all the slp files you want in there then run the [folderpath_set/ -> folderpath_set.mp4] option in the vm

Once the process has begun, you are free to close the instance and let it encode.

After you have finished rendering there is a script included for moving them to a desired location(NAS)

shifty compatibility with wsl!!
# TODO 

Implement mainline
