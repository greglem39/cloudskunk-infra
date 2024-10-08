# The intent of this file is to make it easier for us to define variables, to make it a bit more modular.

variable "region-va" {
  default     = "us-east-1"
  description = "the region in which you will deploy your resources"
}

variable "virginia-a" {
  default     = "us-east-1a"
  description = "us-east-1a AZ"
}

variable "most-recent-windows-version" {
  default     = true
  description = "do we want most recent version"
}

variable "name-filter" {
  default     = "name"
  description = "what filter is this"
}

variable "name-filter-value" {
  default     = "Windows_Server-2022-English-Full-Base-*"
  description = "value of the name filter"
}

variable "virtualization-filter" {
  default     = "virtualization-type"
  description = "virtualization type filter"

}

variable "virtualization-filter-value" {
  default     = "hvm"
  description = "value of virtualization"

}

variable "owners" {
  default     = "801119661308"
  description = "owners value"

}

variable "key-algo" {
  default     = "RSA"
  description = "key type"

}

variable "windows-instance-type" {
  default     = "t2.medium"
  description = "instance type for windows instances"

}

variable "cloudskunk-key-pair" {
  default     = "cloudskunk-instance-key"
  description = "key pair for the rose court"
}

variable "get-pass-data" {
  default     = true
  description = "to get password data for this instance"
}

variable "instance-name" {
  default     = "cloudskunk-dc"
  description = "name of our DC instance"

}

variable "member-instance-name" {
  default     = "cloudskunk-member-1"
  description = "name of our DC instance"

}

variable "rdp-sg-name" {
  default     = "allow-admin-rdp"
  description = "name of sg"
}

variable "rdp-port" {
  default     = 3389
  description = "rdp port"

}

variable "rdp-protocol" {
  default     = "TCP"
  description = "rdp protocol"

}

variable "egress-port" {
  default     = 0
  description = "egress ports"

}

variable "egress-protocol" {
  default     = "-1"
  description = "egress protocol"

}

variable "egress-cidr-block" {
  default = "0.0.0.0/0"

}

variable "parameter-name" {
  default     = "/dev/win-dc-pass"
  description = "name of parameter"

}

variable "member-parameter-name" {
  default     = "/dev/win-member-pass"
  description = "name of parameter"

}

variable "parameter-type" {
  default = "SecureString"

}

# variable "region-cali" {
#   description = "set the region for our aws west alias"
#   default     = "us-west-1"
# }
