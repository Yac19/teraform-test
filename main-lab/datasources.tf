data "aws_vpc" "vpc" {
  tags = {
    Name = "nuumfactory-vpc"
  }
}

data "aws_subnet" "public-subnet-1" {
  tags = {
    Name = "nuumfactory-public-subnet-1"
  }
}

data "aws_subnet" "public-subnet-2" {
  tags = {
    Name = "nuumfactory-public-subnet-2"
  }
}