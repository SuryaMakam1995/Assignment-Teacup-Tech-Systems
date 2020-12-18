resource "aws_instance" "application_instance" {
  ami                         = var.ami
  key_name                    = var.key_name
  instance_type               = var.instance_type
  user_data                   = <<-EOF
                                sudo apt-get update
                                sudo apt-get upgrade
                                sudo apt-get install apache2
                                sudo apt-get update
                                sudo apt-get upgrade
                                sudo apt-get install php5-curl
                                EOF
  security_groups             = [aws_security_group.application_sg.id]
  tags = {
    Name        = "application Server"
    Environment = var.env
  }
  subnet_id                   = aws_subnet.application_subnet.id
  associate_public_ip_address = true
}

resource "aws_instance" "bastion" {
  ami                         = var.ami
  key_name                    = var.key_name
  instance_type               = var.instance_type
  security_groups             = [aws_security_group.bastion_sg.id]
  tags = {
    Name        = "bastion host"
    Environment = var.env
  }
  subnet_id                   = aws_subnet.bastion_subnet.id
  associate_public_ip_address = true
}

resource "aws_instance" "web_instance" {
  ami                         = var.ami
  key_name                    = var.key_name
  instance_type               = var.instance_type
  user_data                   = <<-EOF
                                sudo apt-get update
                                sudo apt-get upgrade
                                sudo apt-get install apache2
                                sudo apt-get update
                                sudo apt-get upgrade
                                sudo apt-get install php5-curl
                                EOF
  security_groups             = [aws_security_group.web_sg.id]
  tags = {
    Name        = "web Server"
    Environment = var.env
  }
  subnet_id                   = aws_subnet.web_subnet.id
  associate_public_ip_address = true
}