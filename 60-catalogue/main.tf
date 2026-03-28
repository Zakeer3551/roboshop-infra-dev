resource "aws_instance" "catalogue" {
  ami                    = data.aws_ami.daws88-s
  instance_type          = var.instance
  vpc_security_group_ids = [local.catalogue_sg_id]
  subnet_id              = local.private_subnet_id
  tags = merge({
    Name = "${var.project}-${var.environment}-catalogue"
    },
    local.common_tags
  )

}

resource "terraform_data" "bootstrap" {
  triggers_replace = [aws_instance.catalogue.id]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = DevOps321
    host     = aws_instance.catalogue.private_ip
  }

  provisioner "file" {
    source      = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }


  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo /tmp/bootstrap.sh catalogue"
    ]
  }
}

