# examples

I keep examples of stuff in here for further reference 


## DMTCP 

"Distributed Multithreadded Checkpointer" from https://github.com/dmtcp/dmtcp. This tool was developed in academia and research circles to checkpoint massive distributed weather models so if they die you dont lose days of compute time. I use it for save/restore of applications running in docker containers. 

Basic example of using DMTCP and issuing a checkpoint in a docker container. 

I use this for checkpointing my containerized applications.

## Gazebo
 
 Gazebo is a huge nightmare - putting it in a container to run headless following their instructions requires **at least 2G** of space...thats crazy....lets try to do better. 
 Currently I have it down to a little over 1G in size, which is not great, but still cuts down 50% of the clunk.

Here's what I did: 

**Multistage Build**
1. Build from source using release settings in a 'build' image 
2. Copy install folder into new image 
3. Install minimum required to run gz sim without a gui 
4. Avoid apt repos wiht `-dev` when possible in favor of smaller non 'dev' packages 


**Where is the best place to look for more reduction?**

QT5 takes up almost 400G and isnt used when we are running headless - if you can figure out how to run without QT the image will be even better. You might be able to build gz sim and not compile in the qt stuff?

