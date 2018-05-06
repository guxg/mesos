## Build Docker Images

cd mesos
docker build -t marketin/mesos:1.5.0 .


cd mesos-master
docker build -t marketin/mesos-master:1.5.0 .


cd mesos-slave
docker build -t marketin/mesos-slave:1.5.0 .



## TroubleShooting


mesos-master.ERROR

E0502 02:53:18.763744     8 master.cpp:2184] EXIT with status 1: Lost leadership... committing suicide!