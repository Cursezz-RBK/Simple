# Public Subnet

resource "aws_subnet" "public" {
  vpc_id            = aws_vpc.main.id 
  cidr_block        = "10.0.1.0/24"     
  availability_zone = "us-west-1b" 
  map_public_ip_on_launch = true
  tags = {
    Name = var.subnet_public
  }
}

# Public Subnet in AZ us-west-1c

resource "aws_subnet" "public_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-1c"
  map_public_ip_on_launch = true

  tags = {
    Name = var.subnet_public_b
  }
}

# Private Subnet

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.main.id  
  cidr_block        = "10.0.3.0/24"     
  availability_zone = "us-west-1b" 
  map_public_ip_on_launch = false

  tags = {
    Name = var.subnet_private 
  }
} 

# Private Subnet in AZ us-west-1c

resource "aws_subnet" "private_b" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = "us-west-1c"
  map_public_ip_on_launch = false

  tags = {
    Name = var.subnet_private_b
  }
}