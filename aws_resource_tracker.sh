#!/bin/bash


##########################################
# Author:Saikrishna
# Date: 05th Jan
#
# Version: v1
#
# This script will report the AWS resource usage
#
# #########################################


# AWS S3
# AWS EC2
# AWS Lambda
# AWS Iam Users

set -x # debug mode
#set -e # exit the scipt when there is an error
#set -o # pipefail


# For reference of commands use aws cli Documentation


# list s3 buckets

echo "Print list of s3 buckets"
aws s3 ls   >> ResourceTracker

# list Ec2 Instances
echo "Print list of Ec2 Instances"
aws ec2 describe-instances | jq '.Reservations[].Instances[].InstanceId' >> ResourceTracker

# List Lambdas
echo "Print list of Lambds"
aws lambda list-functions | jq '.Functions[].FunctionName' >> ResourceTracker
#aws lambda list-functions


# List Iam users
echo "Print list of IAM Users"
#aws iam list-users
aws iam list-users | jq '.Users[].UserName' >> ResourceTracker




