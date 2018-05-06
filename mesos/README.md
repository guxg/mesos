## Build Docker Images

cd mesos
docker build -t marketin/mesos:1.5.0 .


cd mesos-master
docker build -t marketin/mesos-master:1.5.0 .


cd mesos-slave
docker build -t marketin/mesos-slave:1.5.0 .


## container command

Determine the Launch Command: 
http://mesos.apache.org/documentation/latest/isolators/docker-runtime/

## TroubleShooting


> mesos-master.ERROR

E0502 02:53:18.763744     8 master.cpp:2184] EXIT with status 1: Lost leadership... committing suicide!


> mesos-slave.ERROR

E0506 13:55:44.422956     1 main.cpp:498] EXIT with status 1: Failed to create a containerizer: Could not create MesosContainerizer: Failed to create isolator 'docker/volume': The 'docker/volume' isolator cannot get dvdcli command


https://github.com/rexray/dvdcli/releases

https://dl.bintray.com/emccode/dvdcli/install

https://dl.bintray.com/emccode/dvdcli/stable/latest/dvdcli-latest-x86_64.rpm


