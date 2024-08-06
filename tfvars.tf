# this is where I'm storing some vars that I don't want in GitHub

variable "home-ip" { # this is the CIDR I'm using - it's stored as sensitive elsewhere so it doesn't get put in GitHub
  default     = ""
  description = "my home IP"
  sensitive   = true
}

variable "nico-password" {
  default     = ""
  description = "password for user on DC"
  sensitive   = true
}
