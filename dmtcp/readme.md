# How to run the demo

## Build the container 

```make build```

## Run the container demo 

```make run```

The container is now running any you can start with DMTCP Launch


```
dmtcp_launch --new-coord -p 6000 python3 counter.py
```

Refer to this terminal as "terminal 1"

## Issue a checkpoint and restart 

Make a new terminal and refer to it as "terminal 2"

Exec into the container 

```
docker exec -it <container-id> /bin/bash 
```

Checkpoint the application 

```
dmtcp_command -c -p 6000
```

## Return to terminal 1 and restart 

Go back to terminal 1 

Kill the running application with `CTL-C` 

Run 

```
./dmtcp-restart-script.sh 
```

Your counter should resume where it left off. 