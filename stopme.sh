#!/bin/bash

cd terraform
terraform destroy -auto-approve
cd..
echo "All infrastructure is down."
echo ""
echo "You may delete the keys in /terraform/ssh-key."
