#!/bin/bash

export $(cat .env | xargs)

aws ecs list-container-instances \
  --cluster $AWS_ECS_CLUSTER
