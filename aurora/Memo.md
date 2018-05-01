

```
# systemctl status aurora-scheduler
Failed to get D-Bus connection: Operation not permitted
```

https://github.com/CentOS/sig-cloud-instance-images/issues/45

If you need your container startup CMD to run a bash script before starting systemd init (e.g. to do some configuration based on env variables), that works if the script ends by calling exec /usr/sbin/init.


https://github.com/CentOS/sig-cloud-instance-images/issues/41

It seems that if you encounter an error like this, related to systemctl or service, you are trying to use docker the wrong way. Ideally the container should be one process, possibly a process normally running as a service, now running as a container process. If you need to restart it, you have to restart the container. Any config changes you want, should be done through a Dockerfile (a build).

