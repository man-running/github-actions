# This is a script for networking resources, it creates a very simple networking setup in AWS using Terraform.
 # -- N E T W O R K I N G ----------------------------------------------------------------------------------------------

 # Create a Route 53 hosted zone
resource "aws_route53_zone" "main" {
  name = "takara.ai"  # Replace with your domain name
  
  tags = {
    system = "scaffolding"
    iac = "terraform"
  }
}

# -- Create VPC --------------------------------------------------------------------------------
#Create VPC in us-east-1
resource "aws_vpc" "vpc_core" {
# checkov:skip=CKV2_AWS_11: VPC Logging not required on this VPC, used for scaffolding.
# checkov:skip=CKV2_AWS_12: Ensure the default security group of every VPC restricts all traffic
  provider             = aws
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "scaffolding-vpc"
    iac = "scaffolding"
    system = "n8n"
  }
}

# -- Create Subnets --------------------------------------------------------------------------------
 # Public Subnet in AZ A
 resource "aws_subnet" "public_subnet_1" {    # Creating Public Subnet
   vpc_id =  aws_vpc.vpc_core.id
   availability_zone = "${var.az1}" 
   cidr_block = "${var.public_subnet_1}"        # CIDR block of public subnets
    tags = {
      Name = "Scaffolding - Public Subnet One"
      iac = "terraform"
      system = "scaffolding"
   }
 }

 resource "aws_subnet" "public_subnet_2" {
  vpc_id            = aws_vpc.vpc_core.id
  availability_zone = "${var.az2}" 
  cidr_block = "${var.public_subnet_2}"        # CIDR block of public subnets
  tags = {
    Name   = "Scaffolding - Public Subnet Two"
    iac    = "terraform"
    system = "scaffolding"
  }
}
 
 # Private Subnet
 resource "aws_subnet" "private_subnet" {
   vpc_id =  aws_vpc.vpc_core.id
   availability_zone = "${var.az1}" 
   cidr_block = "${var.private_subnet}"          # CIDR block of private subnets
     tags = {
      Name = "Scaffolding - Private Subnet"
      iac = "terraform"
      system = "scaffolding"
   }
}

# -- Connection Resources --------------------------------------------------------------------------------
#Create IGW in us-east-1
resource "aws_internet_gateway" "igw" {
  provider = aws
  vpc_id   = aws_vpc.vpc_core.id
    tags = {
      name = "Scaffolding - Internet Gateway"
      iac = "terraform"
      system = "scaffolding"
   }
}

# -- Route Tables --------------------------------------------------------------------------------
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.vpc_core.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name   = "scaffolding-public-rt"
    system = "scaffolding"
    iac    = "terraform"
  }
}

# -- Route Table Association --------------------------------------------------------------------------------

resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public_subnet_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_subnet_2.id
  route_table_id = aws_route_table.public.id
}
