variable "aws_region"   { description = "AWS region"; type = string; default = "us-west-2" }
variable "app_name"     { description = "Name"; type = string; default = "arcade-ec2-sample" }
variable "instance_type"{ description = "Instance type"; type = string; default = "t3.micro" }
variable "allowed_cidr" { description = "CIDR for HTTP/SSH"; type = string; default = "0.0.0.0/0" }
variable "key_name"     { description = "EC2 key pair (optional)"; type = string; default = "" }
