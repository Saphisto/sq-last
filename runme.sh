#!/bin/bash

## Checking for aws keys 
echo "Scanning for aws keys"
if [ ! -f ~/.aws/credentials ]
    then
        echo "AWS Credentials file is missing, run 'aws configure'."
        echo "File expexted at ~/.aws/credentials but is not there."
        exit 1
fi

## Checking for terraform 
terraform --version >/dev/null 2>&1

if [ $(echo $?) -ne 0 ]
    then   
        echo "Terraform is not installed."
        echo "Please run the terraform installer"
        exit 1
fi


## Creating ssh-key pair
echo "Creating ssh key pair"
mkdir -p ./terraform/ssh-key
ssh-keygen -b 4096 -t rsa -f ./terraform/ssh-key/sq-session -N "" -C "sq-session-key" 

cd terraform
echo ""
echo "Initializing terraform."
terraform init >/dev/null 2>&1
echo ""
echo "Running terraform plan."
terraform plan >/dev/null 2>&1
echo ""
echo "Creating infrastructure, this may take some time."
terraform apply -auto-approve >/dev/null 2>&1
cd ..

echo ""
echo "Finished creating infrastructure."
echo "Installing required software..."

## Adding fingerprint
EC2IP=$(cat ansible/hosts | grep ansible | cut -d '=' -f 2)
ssh-keyscan -t rsa ${EC2IP} >> ~/.ssh/known_hosts

## Running ansible playbooks
cd ansible
for file in $(ls ./playbooks)
    do
        ansible-playbook -i hosts ./playbooks/$file -u ubuntu --key-file=../terraform/ssh-key/sq-session
    done
cd ..

echo "Done installing required software."



echo "Your EC2 is now ready."
echo "Jenkins URL: http://${EC2IP}:8080"
echo "You may also ssh into it by running: 'ssh -i ./terraform/ssh-key/sq-session ubuntu@${EC2IP}"
echo "Remember to run 'aws configure' to configure your aws client"

