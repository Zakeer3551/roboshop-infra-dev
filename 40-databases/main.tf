resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.daws88-s.id
  instance_type = "t3.micro"
  subnet_id = local.database_subnet_id
  vpc_security_group_ids = [local.mongodb_sg_id]
  tags = merge ( local.common_tags,
    {
      Name = "${var.project}-${var.environment}-mongodb" , 
    }
  )

}

resource "terraform_data" "bootstrap" {

    triggers_replace = [
        aws_instance.mongodb.id
    ]

    provisioner "file" {
    source      = "/bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
    }

    connection {
      type = "ssh"
      user = "ec2-user"
      password = local.ssh_password
      host = aws_instance.mongodb.private_ip
    }



        provisioner "remote-exec" {
            inline = [ 
                "chmod +x /tmp/bootstrap.sh" ,
                "sudo sh /tmp/bootstrap.sh mongodb "
            ]
        }
}