# ┌────────────────────────────────────────────────────────────────────┐
# │ Oracle 8 Java                                                      │
# │ https://github.com/shofetim/java                                   │
# ├────────────────────────────────────────────────────────────────────┤
# │ Copyright © 2014 Jordan Schatz                                     │
# │ Copyright © 2014 Noionλabs (http://noionlabs.com)                  │
# ├────────────────────────────────────────────────────────────────────┤
# │ Licensed under the MIT License                                     │
# └────────────────────────────────────────────────────────────────────┘

FROM ubuntu:15.04

MAINTAINER Jordan Schatz "jordan@noionlabs.com"

RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get install -y oracle-java8-installer
RUN export DEBIAN_FRONTEND=noninteractive; echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get install -y oracle-java8-installer
RUN rm -rf /etc/apt/sources.list.d/webupd8team-java.list
