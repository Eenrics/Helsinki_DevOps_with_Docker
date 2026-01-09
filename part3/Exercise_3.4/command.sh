docker build -t builder .

docker run -e DOCKER_USER=mluukkai \
  -e DOCKER_PWD=password_here \
  -v /var/run/docker.sock:/var/run/docker.sock \
  builder mluukkai/express_app mluukkai/testing

## USE OF MOUNTING docker.sock
# The container does not run its own Docker daemon.
# Instead, it uses the host machine’s Docker daemon.
# Any docker commands you run inside the container actually run on the host.