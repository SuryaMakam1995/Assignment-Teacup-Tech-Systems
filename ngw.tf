resource "aws_eip" "nat_gw_eip1" {
  vpc = true
}

resource "aws_nat_gateway" "gw2" {
  allocation_id = aws_eip.nat_gw_eip1.id
  subnet_id     = aws_subnet.web_subnet.id
}

resource "aws_route_table" "nated1" {
  vpc_id = aws_vpc.main.id
  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.gw2.id
  }
  tags = {
      Name = "route-table-1"
  }
}

resource "aws_route_table_association" "nated2" {
    subnet_id = aws_subnet.web_subnet.id
    route_table_id = aws_route_table.nated1.id
}

resource "aws_eip" "nat_gw_eip2" {
  vpc = true
}
resource "aws_nat_gateway" "gw3" {
  allocation_id = aws_eip.nat_gw_eip2.id
  subnet_id     = aws_subnet.application_subnet.id
}
resource "aws_route_table" "nated3" {
  vpc_id = aws_vpc.main.id
  route {
      cidr_block = "0.0.0.0/0"
      nat_gateway_id = aws_nat_gateway.gw3.id
  }
  tags = {
      Name = "route-table-2"
  }
}

resource "aws_route_table_association" "nated4" {
    subnet_id = aws_subnet.application_subnet.id
    route_table_id = aws_route_table.nated3.id
}