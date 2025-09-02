resource "aws_instance" "web" {
  ami           = data.aws_ami.al2023.id
  instance_type = var.instance_type
  subnet_id     = data.aws_subnets.default.ids[0]
  vpc_security_group_ids = [aws_security_group.web.id]
  associate_public_ip_address = true

  user_data = data.template_cloudinit_config.userdata.rendered

  key_name = var.key_name != "" ? var.key_name : null

  tags = { Name = var.app_name }
}

output "arcade_url" { value = "http://${aws_instance.web.public_ip}/" }
output "snake_url"  { value = "http://${aws_instance.web.public_ip}/snake/" }
output "ttt_url"    { value = "http://${aws_instance.web.public_ip}/ttt/" }
output "g4096_url"  { value = "http://${aws_instance.web.public_ip}/4096/" }
