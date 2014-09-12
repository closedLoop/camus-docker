A Docker for Camus  (Kafka to HDFS pipeline)
============================================

This is to support the development and implementation of:
[linkedin/camus](https://github.com/linkedin/camus)

## Usage

sudo docker build -t closedloop/docker-camus .
sudo docker run -t -i --name camus closedloop/docker-camus

## Goals
Assuming Zookeeper and Kafka Cluster are running,

* Create an ubuntu container that pulls 'master' github branch
* compiles from source
* configures and runs `.jar` file
