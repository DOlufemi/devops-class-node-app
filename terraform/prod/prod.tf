variable "access_key" {}
variable "secret_key" {}
variable "key_path" {}
variable "region" {
  default = "us-east-1"
}

provider "aws" {
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
    region = "eu-west-1"
}

resource "aws_instance" "instance_1" {
    ami = "ami-0451d977"
    instance_type = "t2.micro"
    security_groups = ["chris-sec-group"]

    tags {
        Name = "NodeJS DevOps Class App Example"
    }

    connection {
        user = "ubuntu"
        key_file = "${var.key_path}"
    }

    provisioner "remote-exec" {
        inline = [
          "sudo service docker restart",
          "docker run -d -p 8080:8080 christhewintle/devops-class-node-app-with-config"
        ]
    }
}





