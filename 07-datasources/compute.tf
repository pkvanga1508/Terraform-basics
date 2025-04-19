resource "aws_instance" "web" {

  #ngnix AMI: ami-04575d0e0736572cd
  ami                         = data.aws_ami.amazon_ami_us_east_2.image_id #Image id in region us-east-2
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  root_block_device {
    delete_on_termination = true
    volume_size           = 10
    volume_type           = "gp2"
  }
}

resource "aws_s3_bucket" "public_read_bucket" {
    bucket = "my-unique-bucket-name-12345678dsfsaer90"
}