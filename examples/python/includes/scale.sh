if [ "$1" ==  0  ]; then
  aws ecs update-service --service Dask-Scheduler --desired-count 0 --cluster Fargate-Dask-Cluster &
  aws ecs update-service --service Dask-Workers --desired-count 0 --cluster Fargate-Dask-Cluster &
else
  aws ecs update-service --service Dask-Scheduler --desired-count 1 --cluster Fargate-Dask-Cluster &
  aws ecs update-service --service Dask-Workers --desired-count $1 --cluster Fargate-Dask-Cluster &
fi
