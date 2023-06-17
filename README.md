# SQ-Last-Session

This repo contains the automated deployment and installation of an AWS EC2 using Terraform and Ansible.
The EC2 will end up with the following software installed:
- Terraform
- Docker
- Python
- kubectl
- eksctl
- Jenkins Controller (running on port 8080)

The script will check for all requirements, create an ssh keypair for connecting to the new EC2, and then run the terraform command to start an EC2 and create a Security Group (all in/all out) in the region 'us-west-2'. 
It will then run numerous ansible playbooks that will install the software mentioned above.

Finally, the script will return the EC2's public IP, Jenkins URL and Jenkins Unlock Password allowing you to ssh into the machine or http into the Jenkins Server from your browser.


### Requirements:
- A Linux / MacOS machine.
- **AWS** - your machine must be preconfigured with aws-credentials (awscli  configure)
- **Terraform** (Installation script provided)
- **Ansible** (Installation script provided)

### Usage:
- Clone the repo `git clone https://github.com/Inframous/sq-last-session.git`
- To **Deploy and install** run the script `./runme.sh`
- To **stop and delete** the Instance and Security Group run `./stopme.sh` 
- Please note that 'stopme.sh'  script **will not delete** the ssh-keypair in ./terraform/ssh-key.
