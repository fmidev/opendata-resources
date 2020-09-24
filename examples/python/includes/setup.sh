#!/bin/bash
exit
cd base-image
`aws ecr get-login --no-include-email --region eu-west-1`
docker build -t dask .
docker tag dask:latest xx.dkr.ecr.eu-west-1.amazonaws.com/dask:latest
docker push xx.dkr.ecr.eu-west-1.amazonaws.com/dask:latest

# Deploy cloudformation stack dask-cluster.template
cd ..
aws cloudformation deploy --template-file dask-cluster.template --stack-name dask --parameter-overrides VpcId=xx Subnets=xx,xx

# Scale
aws ecs update-service --service Dask-Workers --desired-count 5 --cluster Fargate-Dask-Cluster
aws ecs update-service --service Dask-Scheduler --desired-count 1 --cluster Fargate-Dask-Cluster
