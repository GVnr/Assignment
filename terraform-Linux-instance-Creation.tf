provider "aws" {
  profile    = "Terraform-user"
  access_key = "AKIARRON3VD52XGH3KHE"
  secret_key = "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"
  region     = "eu-central-1"
}

resource "aws_instance" "linux" {
  ami = "ami-01cae1550c0adea9c"
  user_data = file("script.sh")
  tags = {
    Name = "linux-PC"
  }
  instance_type   = "t2.micro"
  key_name        = "Terraform-key (1)"
  security_groups = ["${aws_security_group.allow_ssh_http_customtcp.name}"]
  count           = 5
}

resource "aws_security_group" "allow_ssh_http_customtcp" {
  name = "allow_ssh_http_customtcp"
  tags = {
    Name = "ALLOW_SSH_HTTP_CUSTOMTCP"
  }
  description = "allow ssh & httpd& customtcp traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

ingress {
    from_port        = 8080
    to_port          = 8080
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}
