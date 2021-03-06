resource "aws_security_group" "web_sg" {
  name   = "managed-web-security-group"
  vpc_id = aws_vpc.main.id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.1.0/24"]
  }
  egress {
    protocol    = -1
    from_port   = 0 
    to_port     = 0 
    cidr_blocks = ["10.0.2.0/24"]
  }

  egress {
    protocol    = -1
    from_port   = 0 
    to_port     = 0 
    cidr_blocks = ["10.0.3.0/24"]
  }

  egress{
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.2.0/24"]
  }

  egress{
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.3.0/24"]
  }
}

resource "aws_security_group" "application_sg" {
  name   = "managed-application-security-group"
  vpc_id = aws_vpc.main.id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.1.0/24"]
  }

  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["10.0.2.0/24"]
  }

  egress {
    protocol    = -1
    from_port   = 0 
    to_port     = 0 
    cidr_blocks = ["10.0.1.0/24"]
  }

  egress{
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.1.0/24"]
  }

  egress{
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.2.0/24"]
  }
}

resource "aws_security_group" "bastion_sg" {
  name   = "managed-bastion-security-group"
  vpc_id = aws_vpc.main.id

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.1.0/24"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.2.0/24"]
  }

  ingress {
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.3.0/24"]
  }

  egress {
    protocol    = -1
    from_port   = 0 
    to_port     = 0 
    cidr_blocks = ["10.0.2.0/24"]
  }

  egress {
    protocol    = -1
    from_port   = 0 
    to_port     = 0 
    cidr_blocks = ["10.0.3.0/24"]
  }

  egress{
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.2.0/24"]
  }

  egress{
    protocol    = "tcp"
    from_port   = 22
    to_port     = 22
    cidr_blocks = ["10.0.3.0/24"]
  }
}
