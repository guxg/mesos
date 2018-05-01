FROM centos:latest
MAINTAINER Gu Xiangguo <xiangguo.gu@marketin.cn>

# https://github.com/mesosphere/docker-containers/blob/master/mesos/dockerfile-templates/mesos

RUN rpm -Uvh https://repos.mesosphere.io/el/7/noarch/RPMS/mesosphere-el-repo-7-1.noarch.rpm
RUN yum -y install mesos-1.5.0
RUN yum -y install which wget file
