resource "aws_eip" "staging_ip" {
  domain = "vpc"
  instance = aws_instance.staging.id

  tags = {
    "Name": "Staging IP"
  }
}

resource "aws_eip" "jenkins_ip" {
  domain = "vpc"
  instance = aws_instance.jenkins.id

  tags = {
    "Name": "Jenkins IP"
  }
}