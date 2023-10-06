#!/bin/bash
# To create the VPC that will host the EKS cluster

cd vpc || exit
terraform init
terraform fmt
terraform validate && terraform plan >vpcplan

if [ "$?" -eq "0" ]; then
  echo "Your code has been successfully validated"
  echo "You can view the plan file in vpcplan"
  sleep 2
else
  echo "The code needs some review!"
  exit
fi
terraform apply -auto-approve

# change directory to cluster after VPC is created
cd ../cluster || exit
# Create the EKS cluster
terraform init
terraform fmt
terraform validate && terraform plan >clusterplan

if [ "$?" -eq "0" ]; then
  echo "The code has been successfully validated"
  echo "You can review the plan file in clusterplan"
  sleep 2
else
  echo "The code needs some review!"
  exit
fi
terraform apply -auto-approve

echo "VPC and EKS Cluster are created successfully"
exit