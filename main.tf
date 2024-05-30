terraform {   
    required_providers {
        aws = {
        source  = "hashicorp/aws"
        version = "~> 5"
        }
    }

    required_version = ">= 1.2.0"
    }

provider "aws" {
    region = var.ec2_region
}

#needed security group to allow traffic in port 80
resource "aws_security_group" "allow_http" {
  name_prefix = "allow_http"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "app_server" {
    ami           = var.ec2_ami
    instance_type = "t2.micro"
    user_data = <<-EOL
        #!/bin/bash
        # Update the package repository
        apt-get update -y

        apt-get install -y nginx

        # Create a simple HTML page with the instance name:
        echo "<html>
            <head>
                <title>Hello, World</title>
            </head>
            <body>
                <h1>Hello from ${var.instance_name} in AWS!!</h1>
                <div>This is an example EC2 server in ${var.ec2_region} deployed with Terraform.</div>
            </body>
        </html>" > /var/www/html/index.html

        # Start NGINX and enable it to start on boot
        systemctl start nginx
        systemctl enable nginx
    EOL

    tags = {
        Name = var.instance_name
    }

    #attach security group to instance:
    vpc_security_group_ids = [aws_security_group.allow_http.id]
}
