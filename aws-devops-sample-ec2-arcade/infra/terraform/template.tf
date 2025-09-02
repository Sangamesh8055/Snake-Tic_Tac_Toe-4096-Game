data "template_cloudinit_config" "userdata" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content      = file("${path.module}/userdata.yaml")
  }
}
