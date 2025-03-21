resource "aws_instance" "app" {
  ami = "ami-0e670eb768a5fc3d4" # Amazon Linux 2023
  instance_type = var.instance_type
  subnet_id = aws_subnet.private[0].id
  security_groups = [aws_security_group.web_sg.id]
  user_data = file("install_nginx.sh") # Install and host HTML on EC2
  tags = { Name = "app-instance" }
}
