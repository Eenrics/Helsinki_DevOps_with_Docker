# Docker-CheatSheet
#####

## Docker Engine is madeup of three parts
* CLI
* REST API
* Daemon
###

## Most used commands
|         command        |         explain             |       shorthand        |
| ------------- | ------------- | ------------- |
|  `docker image ls`  |  Lists all images  |  `docker images`  |
|  `docker image rm <image>`  |  Removes an image  |  `docker rmi <image>`  |
|  `docker image pull <image>`  |  Pulls image from a docker registry  |  `docker pull <image>`  |
|  `docker container ls -a`  |  Lists all containers  |  `docker ps -a`  |
|  `docker container run <image>`  |  Runs a container from an image  |  `docker run <image>`  |
|  `docker container run -d <image>`  |  Runs a container from an image in detached mode  |  `docker run -d <image>`  |
|  `docker container run -it <image>`  |  Runs a container from an image in interactive mode  |  `docker run -it <image>`  |
|  `docker container run -p <host_port>:<container_port> <image>`  |  Publish port of the host to container  |  `docker run -p <host_port>:<container_port> <image>`  |
|  `docker container run -v <file/dir_host>:<file/dir_container> <image>`  |  Bind mount volume from host to container  |  `docker run -v <file/dir_host>:<file/dir_container> <image>`  |
|  `docker container run --name <container> <image>`  |  To give a name for the new container to be created  |  `docker run --name <container> <image>`  |
|  `docker container rm <container>`  |  Removes a container  |  `docker rm <container>`  |
|  `docker container rm <container> <container> <container>`  |  Removes multiple containers  |  `docker rm <container> <container> <container>`  |
|  `docker container stop <container>`  |  Stops a container  |  `docker stop <container>`  |
|  `docker container exec <container> <command>`  |  Executes a command inside the container  |  	`docker exec <container> <command>`  |
|  `docker container prune`  |  Deletes all containers  |  	`docker container prune`  |
|  `docker container logs -f <container>`  |  to follow the output of logs of a running container  |  	`docker logs -f <container>`  |
|  `docker container pause <container>`  |  to pause a container without exiting or stoping it  |  `docker pause <container>`  |
|  `docker container unpause <container>`  |  to unpause a paused container  |  `docker unpause <container>`  |
|  `docker container attach <container>`  |  to attach to a running container  |  `docker attach <container>`  |
|  `docker container attach --no-stdin <container>`  |  to attach to a running container with no cmd directed to the container  |  `docker attach --no-stdin <container>`  |
|  `docker container exec -it <container> bash`  |  to enter a container with new process(new terminal).  |  `docker exec -it <container> bash`  |
|  `docker container kill <container>`  |  to kill a container after grace period.  |  `docker kill <container>`  |
|  `docker search <image>`  |  to search for images in the Docker Hub.  |  `docker search <image>`  |
|  `docker container diff <container>`  |  to see the difference between container and the image it is made from.  |  `docker diff <container>`  |
|  `docker commit <container> <new_image>`  |  to create new image from container with the changes made in the container.  |  `docker commit <container> <new_image>`  |
|  `docker container cp <file> <container>:<path>`  |  to copy a file from host to container or vice versa.  |  eg. `docker container cp ./index.js hello-node:/usr/src/app/index.js` |
|  `docker compose -f <docker-compose.yml> up -d`  |  to specify custom docker compose yaml file.  |  eg. `docker compose -f docker-compose.dev.yml up -d` |
> For all of them container can be either the container id or the container name. Same for images
##
> If we pressed `Ctrl + c` in the attached container, the container will stop. If we want to attach to a container while making sure we don't close it from the other terminal we can specify to not attach STDIN with `--no-stdin` option. Or we can detach from attached container by hitting `Ctrl + p`, `Ctrl + q` to detach us from the STDOUT.
--------------------------------------------------------------------------
eg. 
```bash
docker run -d -it --name looper ubuntu sh -c 'while true; do date; sleep 1; done'
```
* The first part, docker run -d. Runs container detached.
* Followed by -it is short for -i and -t. -it allows you to interact with the container by using the command line.
* Because we ran the container with --name looper, we can now reference it easily.
* The image is ubuntu and what follows it is the command given to the container.
```bash
docker logs -f looper
docker pause looper
docker unpause looper
```
> to follow the output of logs of a running container and pausing the looper without exiting or stopping it
```bash
docker run -d --rm -it --name looper-it ubuntu sh -c 'while true; do date; sleep 1; done'
```
> start another process with -it and add --rm in order to remove it automatically after it has exited. The --rm ensures that there are no garbage containers left behind. It also means that docker start can not be used to start the container after it has exited.


> for accessing services runing in the host local, we can use the ip adress of the host. To find the ip address, we can run
```bash
dr show docker0 | grep -Po 'inet \K[\d.]+'dr show docker0 | grep -Po 'inet \K[\d.]+'
```
		
		
		
		
		
		
	 
