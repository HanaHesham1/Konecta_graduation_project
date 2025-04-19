resource "aws_instance" "jenkins" {
  ami                    = var.jenkins_ami
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public[0].id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.jenkins.id]
  tags = {
    Name = "jenkins-server"
  }

  provisioner "remote-exec" {
    inline = [
      "echo 'Triggering Ansible script...'",
      "bash /tmp/run-ansible.sh"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
      host        = self.public_ip
    }
  }

  provisioner "file" {
    source      = "scripts/run-ansible.sh"
    destination = "/tmp/run-ansible.sh"
  }
}
