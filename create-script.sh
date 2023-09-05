#!/bin/bash
# To create the VPC that will host the EKS cluster
cd vpc
terraform init
terraform fmt
terraform validate && terraform plan >vpcplan
terraform apply -auto-approve
#sleep 240
# change directory to cluster after VPC is created
cd ../cluster
# Create the EKS cluster
terraform init
terraform fmt
terraform validate && terraform plan >clusterplan
terraform apply -auto-approve
#sleep 300
# change diretory to users and create users, groups, and roles
cd ../users
terraform init
terraform fmt
terraform validate && terraform plan >usersplan
terraform apply -auto-approve
echo "VPC, Cluster, Users created