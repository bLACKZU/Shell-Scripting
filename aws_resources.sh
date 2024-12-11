#!/bin/bash

#This script gives a list of all the active services in your AWS Account

#This script takes two inputs - <region> & <service_name> eg. aws_resources.sh <region> <service_name>


#Check if proper arguments are passed
if [ $# -ne 2 ]; then
    echo "Please pass both region & service as input"
fi

region=$1
service=$2

#Check if AWS CLI is installed in machine
if [ !command -v aws &> /dev/null ]; then
    echo "AWS CLI is not installed. Please install it and try again"
    exit 1
fi

#Check if AWS account is configured 
if [ ! -d ~/.aws ]; then
    echo "AWS Profile is not configured. Configure and try again!"
    exit 1
fi

case $service in
    ec2)
        echo "Listing EC2 resources"
        aws ec2 describe-instances --region $region
        ;;
    s3)
        echo "Listing S3 resources"
        aws s3 ls --region $region
        ;;
    eks)
        echo "Listing EKS resources"
        aws eks list-clusters --region $region
        ;;
    dynamodb)
        echo "List DDB Tables"
        aws dynamodb list-tables --region $region
        ;;
    *)
        echo "Invalid service. Please enter valid service"
        ;;
esac


