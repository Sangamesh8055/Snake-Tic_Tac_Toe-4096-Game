resource "aws_security_group" "web" {
  name        = "${var.app_name}-sg"
  description = "Allow HTTP(80) + SSH(22)"
  vpc_id      = data.aws_vpc.default.id

  ingress { from_port = 80, to_port = 80, protocol = "tcp", cidr_blocks = [var.allowed_cidr] }
  ingress { from_port = 22, to_port = 22, protocol = "tcp", cidr_blocks = [var.allowed_cidr] }

  egress  { from_port = 0, to_port = 0, protocol = "-1", cidr_blocks = ["0.0.0.0/0"], ipv6_cidr_blocks = ["::/0"] }
}
