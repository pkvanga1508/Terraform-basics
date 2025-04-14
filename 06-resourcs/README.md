1. Deploy a VPC and a subnet
2. Deploy an internet gateway and associate it with the VPC
3. Set up a route table and route to the internet gateway
4. Deploy an EC2 instance inside the created subnet
5. Associate a public IP and a security group that allows public ingress
6. Change EC2 instance to use publicly available NGNIX AMI
7. Destroy the resources