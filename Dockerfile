FROM arm32v7/ubuntu:18.04
MAINTAINER nfacha

# Install required packages
RUN apt-get update && apt-get -y upgrade
RUN apt-get install mongodb -y
    # rm -rf /var/lib/apt/lists/*

# Volumes
VOLUME ["/docker-shares"]
VOLUME ["/var/lib/mongodb"]

# Define default command.
CMD ["mongod"]

# Expose ports.
#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017

ENTRYPOINT /usr/bin/mongod
