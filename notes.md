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
|  `docker image pull <registry>/<repository>/<image>`  |  Pulls image from a other registry  |  `docker pull <registry>/<repository>/<image>`  |
|  `docker container ls -a`  |  Lists all containers  |  `docker ps -a`  |
|  `docker container ls -a --last 3`  |  Lists the last three containers  |  `docker ps -a --last 3`  |
|  `docker container run <image>`  |  Runs a container from an image  |  `docker run <image>`  |
|  `docker container run -d <image>`  |  Runs a container from an image in detached mode  |  `docker run -d <image>`  |
|  `docker container run --rm <image>`  |  Remove it automatically after it has existed  |  `docker run --rm <image>`  |
|  `docker container run -it <image>`  |  Runs a container from an image in interactive mode  |  `docker run -it <image>`  |
|  `docker container run -p <host_port>:<container_port> <image>`  |  Publish port of the host to container  |  `docker run -p <host_port>:<container_port> <image>`  |
|  `docker container run -v <file/dir_host>:<file/dir_container> <image>`  |  Bind mount volume from host to container  |  `docker run -v <file/dir_host>:<file/dir_container> <image>`  |
|  `docker container run --name <container> <image>`  |  To give a name for the new container to be created  |  `docker run --name <container> <image>`  |
|  `docker container rm <container>`  |  Removes a container  |  `docker rm <container>`  |
|  `docker container rm <container> <container> <container>`  |  Removes multiple containers  |  `docker rm <container> <container> <container>`  |
|  `docker container stop <container>`  |  Stops a container  |  `docker stop <container>`  |
|  `docker container exec <container> <command>`  |  Executes a command inside the container  |  	`docker exec <container> <command>`  |
|  `docker container prune`  |  Deletes all containers  |  	`docker prune`  |
|  `docker image prune`  |  Deletes dangling images (with no name and unused)  |  	`docker image prune`  |
|  `docker system prune`  |  to clean almost everything  |  	`docker system prune`  |
|  `docker container logs -f <container>`  |  to follow the output of logs of a running container  |  	`docker logs -f <container>`  |
|  `docker container pause <container>`  |  to pause a container without exiting or stoping it  |  `docker pause <container>`  |
|  `docker container unpause <container>`  |  to unpause a paused container  |  `docker unpause <container>`  |
|  `docker container attach <container>`  |  to attach to a running container  |  `docker attach <container>`  |
|  `docker container attach --no-stdin <container>`  |  to attach to a running container with no cmd directed to the container  |  `docker attach --no-stdin <container>`  |
|  `Ctr+p Ctr+q`  |  to detach from stdout  |  `Ctr+p Ctr+q`  |
|  `docker container exec -it <container> bash`  |  to enter a container with new process(new terminal).  |  `docker exec -it <container> bash`  |
|  `docker container kill <container>`  |  to kill a container after grace period.  |  `docker kill <container>`  |
|  `docker search <image>`  |  to search for images in the Docker Hub.  |  `docker search <image>`  |
|  `docker search <registry>/<image>`  |  to search for images in the other registry.  |  `docker search <registry>/<image>`  |
|  `docker container diff <container>`  |  to see the difference between container and the image it is made from.  |  `docker diff <container>`  |
|  `docker commit <container> <new_image>`  |  to create new image from container with the changes made in the container. (docker commit adds a new layer on top of the image)  |  `docker commit <container> <new_image>`  |
|  `docker container cp <file> <container>:<path>`  |  to copy a file from host to container or vice versa.  |  eg. `docker container cp ./index.js hello-node:/usr/src/app/index.js` |
|  `docker compose -f <docker-compose.yml> up -d`  |  to specify custom docker compose yaml file.  |  eg. `docker compose -f docker-compose.dev.yml up -d` |
|  `docker tag <image>:<tag> <image>:<local_tag>`  |  to tag images locally. (creates the tag <image>:<local_tag> which refers to <image>:<tag>)  |  eg. `docker tag <image>:<tag> <image>:<local_tag>` |
|  `docker tag <image>:<tag> <new_image>:<new_tag>`  |  to rename images  |  eg. `docker tag <image>:<tag> <new_image>:<new_tag>` |
|  `docker build . -t <name>`  |  to build image in current directory with name  |  eg. `docker build . -t <name>` |
|  `docker cp ./<file_name> <container_name_or_id>:<container_path>`  |  to copy file to docker container  |  eg. `docker cp ./<file_name> <container_name_or_id>:<container_path>` |
|  `docker cp "<container_id_or_name>://<path_to_file_in_container>" .`  |  to copy file from docker container  |  eg. `docker cp "<container_id_or_name>://<path_to_file_in_container>" .` |
|  `docker diff <container_name_or_id>`  |  to check for change in the container  |  eg. `docker diff <container_name_or_id>` |
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
-  Usually like the following: `registry/organisation/image:tag`. But may be as short as `ubuntu`, then the registry will default to `Docker hub`, `organisation` to `library` and `tag` to `latest`. The organisation may also be a `user`, but calling it an organisation may be more clear.
- `docker run -it hello-docker sh` in this script we replaced the CMD of the dockerfile with `sh` and used `-i` and `-t` to start the container so that we can interact with it.
```bash
$ docker diff zen_rosalind
  C /usr
  C /usr/src
  C /usr/src/app
  A /usr/src/app/additional.txt
  C /root
  A /root/.ash_history
  ```
  - `A = added, D = deleted, C = changed.`

  - if a image has `ENTRYPOINT` defined, `CMD` is used to define it the default arguments. `ENTRYPOINT` vs `CMD` can be confusing - in a properly set up image, the __command__ represents an argument list for the __entrypoint__. By default, the __entrypoint__ in Docker is set as `/bin/sh -c` and this is passed if no entrypoint is set. This is why giving the path to a script file as `CMD` works: you're giving the file as a parameter to `/bin/sh -c`. If an image defines both, then the `CMD` is used to give default arguments to the __entrypoint__.

  - There are two ways to set the `ENTRYPOINT` and `CMD`: `exec form` and `shell form`. We've been using the exec form where the command itself is executed. In shell form the command that is executed is wrapped with `/bin/sh -c` - it's useful when you need to evaluate environment variables in the command like `$MYSQL_PASSWORD` or similar.

|    __Dockerfile__             |       __Resulting command__        |
| ------------- | ------------- |
|`ENTRYPOINT` /bin/ping -c 3 `CMD` localhost  |  /bin/sh -c '/bin/ping -c 3' /bin/sh -c localhost  |
|`ENTRYPOINT`  ["/bin/ping","-c","3"] `CMD` localhost  |  /bin/ping -c 3 /bin/sh -c localhost  |
|`ENTRYPOINT`  /bin/ping -c 3 `CMD`  ["localhost"]  |  /bin/sh -c '/bin/ping -c 3' localhost  |
|`ENTRYPOINT` ["/bin/ping","-c","3"] `CMD`  ["localhost"]  |  /bin/ping -c 3 localhost  |

- Most of the time we can ignore `ENTRYPOINT` when building our images and only use `CMD`. For example, Ubuntu image defaults the `ENTRYPOINT` to bash so we do not have to worry about it. And it gives us the convenience of allowing us to overwrite the `CMD` easily, for example, with bash to go inside the container.

- We should use quote if the file name has space in it. eg.
```
docker cp "determined_elion://mydir/Welcome to Kumpula campus! ｜ University of Helsinki [DptFY_MszQs].mp4" .
```
