resource "aws_instance" "web" {
  ami           = var.ami_id 
  instance_type = var.ec2_instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  subnet_id     = aws_subnet.public.id
  key_name      = "Jenkins_Ninjas_US-WEST-1"
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = var.ec2_web
  }
}


/*resource "aws_instance" "rds" {
  ami           = var.ami_id 
  instance_type = var.ec2_instance_type
  iam_instance_profile = aws_iam_instance_profile.ec2_instance_profile.name
  subnet_id     = aws_subnet.private.id
  key_name      = "Jenkins_Ninjas_US-WEST-1"
  associate_public_ip_address = false
  vpc_security_group_ids = [aws_security_group.ec2_sg2.id, aws_security_group.rds_sg.id]

  tags = {
    Name = var.ec2_rds
  }
}*/