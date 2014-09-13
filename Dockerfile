FROM sequenceiq/hadoop-docker:2.5.0

MAINTAINER closedloop <sean.kruzel@gmail.com>

#RUN echo "deb http://archive.ubuntu.com/ubuntu precise universe" >> /etc/apt/sources.list
RUN yum update -y
RUN yum install -y unzip wget git curl vim
#RUN apt-get install -y openjdk-6-jdk

# CLONE linkedin/camus repo
RUN mkdir -p /usr/src/linkedin
WORKDIR /usr/src/linkedin
RUN git clone https://github.com/linkedin/camus.git
WORKDIR /usr/src/linkedin/camus

# Install tools to compile code
#RUN wget http://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
#RUN yum -y install apache-maven

ENV VERSION 0.1

RUN wget http://psg.mtu.edu/pub/apache/maven/maven-3/3.2.3/binaries/apache-maven-3.2.3-bin.tar.gz 
RUN tar xzf apache-maven-3.2.3-bin.tar.gz -C /usr/local
WORKDIR /usr/local
RUN ln -s apache-maven-3.2.3 maven

ENV M2_HOME /usr/local/maven
ENV PATH ${M2_HOME}/bin:${PATH}

# Insert into pom.xml the version speficications to help compile
#WORKDIR /usr/src/linkedin/camus/
#ADD maven_plugins /usr/src/linkedin/camus/
# RUN cp pom.xml oldpom.xml
#ENV maven_plugins $(cat maven_plugins)

# insert new plugin at the start of the plugins section of pom.xml
#RUN sed -i "s|<plugins>|<plugins>$maven_plugins|" pom.xml 
#RUN cat maven_plugins |  sed "s/KEYWORD/$(echo $REPLACE | sed -e 's/\\/\\\\/g' -e 's/\//\\\//g' -e 's/&/\\\&/g')/g"

# Compile code
WORKDIR /usr/src/linkedin/camus
RUN  mvn clean package

ENV IMAGE_VERSION_DATE 2014-09-12

CMD /bin/bash
