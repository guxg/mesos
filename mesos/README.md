## Build Docker Images

cd mesos
docker build -t marketin/mesos:1.5.0 .


cd mesos-master
docker build -t marketin/mesos-master:1.5.0 .


cd mesos-slave
docker build -t marketin/mesos-slave:1.5.0 .
