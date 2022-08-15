packer {
  required_plugins {
    amazon = {
      version = ">= 0.0.2"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

variable "steam_api_key" {
    type = string
    default = "3535DB0D710371A16D9B56150BB47700"
}

source "amazon-ebs" "ubuntu-16LTS" {
  ami_name      = "screeps-server-gkling"
  instance_type = "c3.large"
  region        = "us-west-1"
  source_ami    = "ami-007ef5e8a5e43d323"
  ssh_username  = "ubuntu"
}

build {
  name = "amazon-linux2-jenkins"
  sources = [
    "source.amazon-ebs.ubuntu-16LTS"
  ]
  provisioner "shell" {
    execute_command = "sudo -E -S '{{ .Path }}'"
    script          = "./01_setup_backend.sh"
  }
  provisioner "file" {
    source      = "./screeps-world.service"
    destination = "/tmp/"
  }
  provisioner "shell" {
    execute_command = "sudo -E -S '{{ .Path }}' ${var.steam_api_key}"
    script          = "./02_setup_screeps.sh"
  }
}