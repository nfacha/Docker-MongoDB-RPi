FROM resin/rpi-raspbian
MAINTAINER nfacha

# Install required packages
RUN apt-get update && apt-get -y dist-upgrade
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 9DA31620334BD75D9DCB49F368818C72E52529D4
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu xenial/mongodb-org/4.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.0.list
RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install libcurl3 -y
RUN apt-get install -y mongodb-org -y
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
