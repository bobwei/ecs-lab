#!/bin/bash

# export env from .env file
export $(cat .env | xargs)

# create user_data script to run on instance launch
envsubst < user-data.tmpl > user-data.sh


# configure ecs-cli
ecs-cli configure \
  --cluster $AWS_ECS_CLUSTER \
  --region $AWS_ECS_REGION \
  --profile $AWS_DEFAULT_PROFILE


# create ECS cluster from ECS CLI, AWS CLI or manually on EC2 Management Console


# create cluster and launch ec2 instances from ECS CLI
# ecs-cli up \
#   --keypair vr-fe \
#   --capability-iam \
#   --size 2 \
#   --instance-type t2.small


# create cluster from AWS CLI
aws ecs create-cluster --cluster-name $AWS_ECS_CLUSTER

# create ec2 instances from AWS CLI

# run ec2 instances
aws ec2 run-instances \
  --image-id $AWS_EC2_AMI_ID \
  --instance-type $AWS_EC2_INSTANCE_TYPE \
  --iam-instance-profile $AWS_EC2_IAM_INSTANCE_PROFILE \
  --user-data $AWS_EC2_USER_DATA \
  --block-device-mappings $AWS_EC2_BLOCK_DEVICE_MAPPINGS \
  --subnet-id $AWS_EC2_SUBNET_ID \
  --associate-public-ip-address \
  --key-name $AWS_EC2_KEY_NAME \
  --count $AWS_EC2_COUNT
