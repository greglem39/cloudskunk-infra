terraform {
  backend "remote" {
    organization = "glitchycat"

    workspaces {
      name = "cloudskunk-infra"
    }

  }
}

#need to update everything in the backend 
