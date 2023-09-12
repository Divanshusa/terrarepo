provider "aws" {
 profile = "default"
 region = "ap-south-1"
}

resource "aws_vpc" "terravpc" {
 cidr_block = "10.0.0.0/16"
 tags = {
  Name = "terravpc"
 }
}
#ok
resource "aws_subnet" "terrasub" {
 vpc_id = aws_vpc.terravpc.id
 availability_zone = "ap-south-1a" 
 cidr_block = "10.0.1.0/24"
 tags = {
  Name = "terrasub1"
 }
}

resource "aws_internet_gateway" "terraigw" {
 vpc_id = aws_vpc.terravpc.id
 cidr = "0.0.0.0/0"
 tags = {
  Name = "terraigw"
  }
}
