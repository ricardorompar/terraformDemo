terraform {   
    cloud {
        organization = "acme-corp-demo-rr"
        workspaces {
            name = "terraform-demo"
        }
    }

    required_providers {
        aws = {
            source  = "hashicorp/aws"
            version = "~> 5"
        }
    }

    required_version = ">= 1.2.0"
    }

provider "aws" {
    region = var.aws_region
}


module "aws_instance" {
    source         = "./modules/aws_instance"
    ec2_ami        = var.aws_ami
    ec2_region     = var.aws_region
    instance_name  = var.aws_name
}