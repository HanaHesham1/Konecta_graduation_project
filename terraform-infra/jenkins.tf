resource "aws_instance" "jenkins_vm" {
  ami                    = "ami-0c55b159cbfafe1f0" # dummy, localstack doesn't launch real EC2
  instance_type          = "t2.micro"
  availability_zone      = "us-east-1a"
  key_name               = "jenkins-key"
  subnet_id              = "subnet-123456"

  tags = {
    Name = "jenkins-server"
  }
}
