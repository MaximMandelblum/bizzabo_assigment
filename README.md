# bizzabo_assigment

# Terraform

Can find all VPC configuration in <bizzabo_vpc.tf> file .
All LB and r53 related configuration in the file <bizzabo_elb_r53.tf>
All variables in <varibles.tf> file
Few outputs of subnets and vpc id .

# Few steps before running

Please replace in variables to the <profile> you using to connect aws or add in the privider the aws credentials to which you want create the infrustrucre on it .

Please Run tf init before running tf plan and after that tf apply to build all infrustructure .

At the end don't forget destory all .

# Reagerding the code

First, make sure you have Boto3 installed by running "pip install boto3" in your Python environment.

You need to have proper AWS credentials set up on your system for the Boto3 library to access your AWS account.

This script will check each region and list the AWS services available in that region.
Then it will try to get and display the full details using the describe_service() method of each service .
The try-except part i added to handle cases where the service may not support the describe_service() method, or there might be some other issues.
