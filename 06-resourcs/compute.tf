resource "aws_instance" "web" {

  #ngnix AMI: ami-04575d0e0736572cd
  ami                         = "ami-04985531f48a27ae7" # Amazon Linux 2 AMI
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public.id
  vpc_security_group_ids      = [aws_security_group.public_http_traffic.id]
  root_block_device {
    delete_on_termination = true
    volume_size           = 8
    volume_type           = "gp2"
  }
  tags = merge(local.common_tags, {
    Name = "06-resources-ec2"
  })
  lifecycle {
    create_before_destroy = true
    ignore_changes = [
      tags  # Ignore changes to tags
    ]
  }
}

resource "aws_security_group" "public_http_traffic" {
  description = "Allow HTTP traffic on port 80 and 8443"
  vpc_id      = aws_vpc.main.id
  name        = "public-http-traffic"
  tags = merge(local.common_tags, {
    Name = "06-resources-security-group"
  })
}

resource "aws_vpc_security_group_ingress_rule" "http" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  to_port           = 80
  ip_protocol       = "tcp"
}

resource "aws_vpc_security_group_ingress_rule" "https" {
  security_group_id = aws_security_group.public_http_traffic.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 8443
  to_port           = 8443
  ip_protocol       = "tcp"
}