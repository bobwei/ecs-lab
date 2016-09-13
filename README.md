# ECS Deploy Scripts

This is a hands-on notes with ECS deployment.


## Usage

1. Create .envs/your_env and link .env to .envs/your_env

.env template

```
AWS_ECS_CLUSTER=testwebapp
AWS_ECS_REGION=us-west-2

AWS_EC2_AMI_ID=ami-2d1bce4d
AWS_EC2_COUNT=1
AWS_EC2_INSTANCE_TYPE=t2.small
AWS_EC2_KEY_NAME=vr-fe
AWS_EC2_BLOCK_DEVICE_MAPPINGS=file://block-device-mapping.json
AWS_EC2_SUBNET_ID=subnet-26db9950
AWS_EC2_USER_DATA=file://user-data.sh
AWS_EC2_IAM_INSTANCE_PROFILE=Name\=prism-ecsInstanceRole1
```

```
ln -s .envs/your_env .env
```

Create Cluster
```
./create-cluster.sh
```


## Reference

* [ECS run-instances](http://docs.aws.amazon.com/cli/latest/reference/ec2/run-instances.html)
* [Launch Container Instance](http://docs.aws.amazon.com/AmazonECS/latest/developerguide/launch_container_instance.html)
