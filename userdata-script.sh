#!/bin/bash

 

# Update repo-hosted software

sudo yum -y update

sudo yum -y install git

 

# Add environment variables to allow access to terraform

cat <<EOF >> /home/ec2-user/.bashrc

 

export http_proxy=http://no-proxy.app.c9.equifax.com:3128

export https_proxy=http://no-proxy.app.c9.equifax.com:3128

export HTTP_PROXY=http://no-proxy.app.c9.equifax.com:3128

export HTTPS_PROXY=http://no-proxy.app.c9.equifax.com:3128

export NO_PROXY='169.254.169.254'

EOF

 

cd /home/ec2-user

source .bashrc

 

 

# Configure the AWS CLI

mkdir .aws

cat <<EOF > .aws/config

[default]

region = us-east-1

EOF

 

# Generate an ssh key for use with bitbucket

ssh-keygen -t rsa -f id_rsa  -N ''

 

# Configure git for use with codecommit

git config --global credential.helper '!aws codecommit credential-helper $@'

git config --global credential.UseHttpPath true

 

# Install terraform

curl -o /tmp/terraform.zip  https://releases.hashicorp.com/terraform/0.11.10/terraform_0.11.10_linux_amd64.zip

unzip /tmp/terraform.zip

rm /tmp/*.zip

sudo mv /tmp/terraform /usr/bin

sudo chmod 755 /usr/bin/terraform