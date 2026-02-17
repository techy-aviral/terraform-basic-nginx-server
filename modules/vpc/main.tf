resource "aws_vpc" "my_vpc"{
    cidr_block = "10.0.0.0/16"
    tags = {
      Name= "website-vpc"
    }
}

resource "aws_subnet" "my_public_subnet" {
  vpc_id     = aws_vpc.my_vpc.id
  cidr_block = "10.0.0.0/24"
  map_public_ip_on_launch= true

  tags = {
    Name = "my-public-subnet"
  }
}

resource "aws_internet_gateway" "my_igw" {
  vpc_id = aws_vpc.my_vpc.id

  tags = {
    Name = "my-igw"
  }
}

resource "aws_route_table" "public_subnet_rt" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my_igw.id
  }

  tags = {
    Name = "public-subnet-rt"
  }
}

resource "aws_route_table_association" "associate_rt_to_pub_sub" {
  subnet_id      = aws_subnet.my_public_subnet.id
  route_table_id = aws_route_table.public_subnet_rt.id
}

output "my_public_subnet" {
  value = aws_subnet.my_public_subnet.id
}

output "vpc_id" {
  value = aws_vpc.my_vpc.id
}
