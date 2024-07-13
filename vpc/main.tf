#########################
#### VPC Creation ####
resource "aws_vpc" "vpc1" {
  cidr_block = "10.0.0.0/24"
  tags = { Name = vpc1}
}
#### IGW Creation and Association ####
resource "aws_internet_gateway" "igw1" {
  vpc_id = aws_vpc.vpc1.id
  tags = {Name = "igw1"}
}


#### Subnet Creation ####
resource "aws_subnet" "publicsubnet1" {
  vpc_id = aws_vpc.vpc1.id
  cidr_block = "10.0.0.0/27"
  availability_zone = "us-east-1a"
  tags = {Name = "public-subnet1"}
}


resource "aws_subnet" "publicsubnet2" {
  vpc_id = aws_vpc.vpc1.id
  cidr_block = "10.0.0.32/27"
  availability_zone = "us-east-1b"
  tags = {Name = "public-subnet2"}
}

resource "aws_subnet" "websubnet1" {
  vpc_id = aws_vpc.vpc1.id
  cidr_block = "10.0.0.64/27"
  availability_zone = "us-east-1a"
  tags = {Name = "web-subnet1"}
}


resource "aws_subnet" "websubnet2" {
  vpc_id = aws_vpc.vpc1.id
  cidr_block = "10.0.0.96/27"
  availability_zone = "us-east-1b"
  tags = {Name = "web-subnet2"}
}

resource "aws_subnet" "dbsubnet1" {
  vpc_id = aws_vpc.vpc1.id
  cidr_block = "10.0.0.128/27"
  availability_zone = aws_availability_zones.availability_zone[1]
  tags = {Name = "db-subnet1"}
}


resource "aws_subnet" "dbsubnet2" {
  vpc_id = aws_vpc.vpc1.id
  cidr_block = "10.0.0.160/27"
  availability_zone = "us-east-1b"
  tags = {Name = "db-subnet2"}
}

resource "aws_route_table" "rtb1" {
  vpc_id = aws_vpc.vpc1.id
  route {
            cidr_block = "0.0.0.0/0"
            gateway_id = aws_internet_gateway.igw1.id
  }
  tags = {Name = "rtb1"}
}

resource "aws_route_table_association" "rtba1" {
    subnet_id = aws_subnet.publicsubnet1.id
    route_table_id = aws_route_table.rtb1.id
}

resource "aws_route_table_association" "rtba2" {
    subnet_id = aws_subnet.publicsubnet2.id
    route_table_id = aws_route_table.rtb1.id
}