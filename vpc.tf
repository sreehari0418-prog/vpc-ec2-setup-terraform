resource "aws_vpc" "main" {
  cidr_block = var.cidr
  tags = {
  Name = var.vpc }
}
resource "aws_subnet" "public" {
  cidr_block        = var.subnet-cidr
  vpc_id            = aws_vpc.main.id
  availability_zone = var.subnet-availability-zone
  tags = {
    Name = "public"
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "main-gateway"
  }
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
  tags = {
    Name = "public-route-table"
  }
}
resource "aws_route_table_association" "public" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.public.id
}