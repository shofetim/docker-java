# ┌────────────────────────────────────────────────────────────────────┐
# │ Oracle 8 Java                                                      │
# │ https://github.com/shofetim/java                                   │
# ├────────────────────────────────────────────────────────────────────┤
# │ Copyright © 2014 Jordan Schatz                                     │
# │ Copyright © 2014 Noionλabs (http://noionlabs.com)                  │
# ├────────────────────────────────────────────────────────────────────┤
# │ Licensed under the MIT License                                     │
# └────────────────────────────────────────────────────────────────────┘

# Start from docker's debian:wheezy which is currently the most
# minimal and trust worthy
# https://registry.hub.docker.com/_/debian/
FROM debian:wheezy

MAINTAINER Jordan Schatz "jordan@noionlabs.com"

# Let apt know that we will be running non-interactively.
ENV DEBIAN_FRONTEND noninteractive

# Install Java.

# Oracle's java requires a web based click through to download and
# install. To facilitate that we use the Java installer and
# instructions from
# http://www.webupd8.org/2012/06/how-to-install-oracle-java-7-in-debian.html

# To minimize image size, we run this as a single layer, and clean up
# after ourselves.

RUN \
    echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu precise main" > /etc/apt/sources.list.d/webupd8team-java.list  && \
    apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886  && \
    apt-get update  && \
    echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections  && \
    apt-get install -y oracle-java8-installer  && \
    rm -rf /etc/apt/sources.list.d/webupd8team-java.list

# This is a convenience so that `docker run shofetim/java` will start
# a shell that you use to "look around" inside the container or issue
# java commands from. It is not the recommended way to use this image,
# rather extend it in your Dockerfile (FROM shofetim/java) and build a
# service off it that.

CMD ["bash"]
