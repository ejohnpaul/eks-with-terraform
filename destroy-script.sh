#!/bin/bash
# Destroying the resources created
cd users
terraform destroy -auto-approve
#sleep 180
cd ../cluster
terraform destroy -auto-approve
#sleep 360
cd ../vpc
#cd vpc
terraform destroy -auto-approve
cd ..
echo "Resources completely destroyed"