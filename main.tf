data "aws_ami" "windows" { # pulling latest version of windows server
  most_recent = var.most-recent-windows-version

  filter {
    name   = var.name-filter
    values = [var.name-filter-value]
  }

  filter {
    name   = var.virtualization-filter
    values = [var.virtualization-filter-value]
  }

  owners = [var.owners]

}

resource "tls_private_key" "instance-key" { #generating an RSA key
  algorithm = var.key-algo
}

resource "aws_key_pair" "cloudskunk-instance-key" { #creating an instance key
  key_name   = var.cloudskunk-key-pair
  public_key = tls_private_key.instance-key.public_key_openssh
}

resource "aws_security_group" "allow-RDP" { # want to allow RDP from specified location
  name        = var.rdp-sg-name
  description = "to allow home RDP"

  ingress {
    description = "RDP from home"
    from_port   = var.rdp-port
    to_port     = var.rdp-port
    protocol    = var.rdp-protocol
    cidr_blocks = [var.home-ip]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["172.31.0.0/20"] # this is a test
  }

  ingress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = true
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = -1
    self      = true
  }

}

resource "aws_instance" "cloudskunk-member" { #creating a member ec2 for our AD domain
  depends_on        = [tls_private_key.instance-key]
  ami               = data.aws_ami.windows.id
  instance_type     = var.windows-instance-type
  availability_zone = var.virginia-a
  key_name          = aws_key_pair.cloudskunk-instance-key.key_name
  get_password_data = var.get-pass-data
  security_groups   = [aws_security_group.allow-RDP.name]
  tags = {
    Name = var.member-instance-name
  }
  count = 1 # change depending on how many you want to deploy

}
resource "aws_ssm_parameter" "windows-ec2-member" { # storing the windows password so we don't leave it in plaintext in code
  name       = var.member-parameter-name
  type       = var.parameter-type
  depends_on = [aws_instance.cloudskunk-member]
  value      = rsadecrypt(aws_instance.cloudskunk-member[0].password_data, nonsensitive(tls_private_key.instance-key.private_key_pem))
}
