A Docker for Camus  (Kafka to HDFS pipeline)
============================================

This is to support the development and implementation of:
[linkedin/camus](https://github.com/linkedin/camus)

## Needs

Currently this docker will compile and launch an instance with the code and libraries necessary to compile the linkedin/camus distribution.

We are looking to add:
* environment variables to configure the system
  * Appears location of kafka cluster and hadoop cluster are needed
  * Other optional variables are needed
* script to create launch the correct hadoop job to run camus

Please feel free to contribute!

## Usage at this point

To build
```
docker build -t closedloop/docker-camus .
```
To start docker
```
docker run -t -i --name camus closedloop/docker-camus
```
To start service
```
#To Be Determined
```

## Goals
Assuming Zookeeper and Kafka Cluster are running,

* Create an ubuntu container that pulls 'master' github branch
* compiles from source
* configures and runs `.jar` file
