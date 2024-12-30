# examples

I keep examples of stuff in here for further reference 


## DMTCP 

"Distributed Multithreadded Checkpointer" from https://github.com/dmtcp/dmtcp. This tool was developed in academia and research circles to checkpoint massive distributed weather models so if they die you dont lose days of compute time. I use it for save/restore of applications running in docker containers. 

Basic example of using DMTCP and issuing a checkpoint in a docker container. 

I use this for checkpointing my containerized applications.

## Gazebo
 
 Gazebo is a huge nightmare - putting it in a container to run headless following their instructions requires **at least 2G** of space...thats crazy....lets try to do better. 
 Currently I have it down to a little over 1G in size, which is not great, but still cuts down 50% of the clunk.

build it with 
```
cd gazebo 
make build
```

Run it with 
```
docker run -it gz gz-build/install/bin/gz sim -r -v -s box.sdf
```

Here's what I did: 

**Multistage Build**
1. Build from source using release settings in a 'build' image 
2. Copy install folder into new image 
3. Install minimum required to run gz sim without a gui 
4. Avoid apt repos wiht `-dev` when possible in favor of smaller non 'dev' packages 


**Where is the best place to look for more reduction?**

QT5 takes up almost 500G and isnt really used when we are running headless - if you can figure out how to run without QT the image will be a image of less than 700M in size. You might be able to build gz sim and not compile in the qt stuff?

heres a link to the only cmake file in gzsim that depends on qt

https://github.com/gazebosim/gz-sim/blob/9d6230a562c5d463306070b07269b135f9ecd134/src/gui/CMakeLists.txt#L54

## DTED
 
Digital Terrain Elevation Data (DTED) is a standardized set of data which provide terrain elevation data for the Earth. 

This set of python tools helps download and interact with the DTED data which is publically available. 

https://en.wikipedia.org/wiki/DTED

## python-pkg 

A basic example of the format and structure of a python package with 
- packaing for pip
- unit testing 
- auto-versioning via emoji 

I'll set it up using a 'src layout' 

Read about that here:
https://packaging.python.org/en/latest/discussions/src-layout-vs-flat-layout/#src-layout-vs-flat-layout

