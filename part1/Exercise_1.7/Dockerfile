# Start from the ubuntu 24.04 image
FROM ubuntu:24.04

# Use /usr/src/app as our workdir. The following instructions will be executed in this location.
WORKDIR /usr/src/app

# Install curl
RUN apt update -y && apt upgrade -y && apt install curl -y

# Copy the hello.sh file from this directory to /usr/src/app/ creating /usr/src/app/hello.sh
COPY script.sh .

# Alternatively, if we skipped chmod earlier, we can add execution permissions during the build.
RUN chmod +x script.sh

# When running docker run the command will be ./script.sh
CMD ./script.sh