
resource "aws_vpc" "vdc2_main_vpc" {
  cidr_block       = "10.10.0.0/16"
  instance_tenancy = "default"

tags = {
    Name = "vdc2_main_vpc"
    VDC = "2"
    TerraformManaged = 1
  }
}

resource "aws_internet_gateway" "vdc2_main_gw" {

    vpc_id = aws_vpc.vdc2_main_vpc.id

tags = {
    Name = "vdc2_main_gw"
    VDC = "2"
    TerraformManaged = 1
  } 
}

resource "aws_subnet" "vdc2_main_subnet_private" {
    vpc_id = aws_vpc.vdc2_main_vpc.id
    cidr_block = "10.10.10.0/24"
    map_public_ip_on_launch = false

tags = {
    Name = "vdc2_main_subnet_private"
    VDC = "2"
    TerraformManaged = 1
  } 
}

resource "aws_route_table" "vdc2_main_rt" {
 vpc_id = aws_vpc.vdc2_main_vpc.id
 
tags = {
    Name = "vdc2_main_rt"
    VDC = "2"
    TerraformManaged = 1
    Main = "Yes"
  } 

}

resource "aws_route" "vdc2_default_route_out" {
  route_table_id = aws_route_table.vdc2_main_rt.id
  destination_cidr_block    = "0.0.0.0/0"
  gateway_id     = aws_internet_gateway.vdc2_main_gw.id
}

resource "aws_route_table_association" "vdc2_sub_route_association_a" {
  subnet_id      = aws_subnet.vdc2_main_subnet_private.id
  route_table_id = aws_route_table.vdc2_main_rt.id
}