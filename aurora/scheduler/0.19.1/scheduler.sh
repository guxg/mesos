#!/bin/bash

AURORA_HOME=/usr/lib/aurora

# cat /etc/sysconfig/aurora-scheduler
GLOG_v=0
LIBPROCESS_PORT=8083
#LIBPROCESS_IP=127.0.0.1

# aurora framework is written in java

# Flags that control the behavior of the JVM.
JAVA_OPTS=(
  # Uses server-level GC optimizations, as this is a server.
  -server

  # Location of libmesos-XXXX.so / libmesos-XXXX.dylib
  -Djava.library.path='/usr/lib;/usr/lib64'
)

# Flags control the behavior of the Aurora scheduler.
# For a full list of available flags, run /usr/lib/aurora/bin/aurora-scheduler -help

AURORA_FLAGS=(
 # The name of this cluster.
 -cluster_name=${CLUSTER_NAME:-aurora}
 # The HTTP port upon which Aurora will listen.	
 -http_port=${HTTP_PORT:-8081}
 # The ZooKeeper URL of the ZNode where the Mesos master has registered.
 -mesos_master_address=${MESOS_MASTERS:?"MESOS_MASTERS must not be empty"}
 # The ZooKeeper quorum to which Aurora will register itself.
 -serverset_path=${AURORA_ZK_PATH:-/aurora}
 # The ZooKeeper ZNode within the specified quorum to which Aurora will register its
 # ServerSet, which keeps track of all live Aurora schedulers. 
 -zk_endpoints=${ZK_ENDPOINTS:?"ZK_ENDPOINTS must not be empty"}
 # Allows the scheduling of containers of the provided type.
 -allowed_container_types=${ALLOWED_CONTAINER_TYPES:-MESOS,DOCKER}

 ### Native Log Settings ###
 -native_log_quorum_size=${NATIVE_LOG_QUORUM_SIZE:-1}
 # The ZooKeeper ZNode to which Aurora will register the locations of its replicated log.
 -native_log_zk_group_path=${NATIVE_LOG_ZK_GROUP_PATH:-/tmp/aurora/replicated-log}
 # The local directory in which an Aurora scheduler can find Aurora's replicated log.
 -native_log_file_path=${NATIVE_LOG_FILE_PATH:-/var/lib/aurora/scheduler/db}
 # The local directory in which Aurora schedulers will place state backups.
 -backup_dir=${BACKUP_DIR:-/tmp/aurora/backup}
 # The hostname to advertise in ZooKeeper instead of the locally-resolved hostname. 
 -hostname=${HOSTNAME:?"HOSTNAME must not be empty"}
  ### Thermos Settings ###
 -thermos_executor_path=${THERMOS_EXECUTOR_PATH:-/usr/bin/thermos_executor}
 -thermos_executor_cpu=${THERMOS_EXECUTOR_CPU:-0.25}
 -thermos_executor_ram=${THERMOS_EXECUTOR_RAM:-32MB}
 -allow_docker_parameters=true
)

exec "$AURORA_HOME/bin/aurora-scheduler" "${AURORA_FLAGS[@]}"
