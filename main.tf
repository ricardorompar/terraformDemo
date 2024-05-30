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
        google = {
            source = "hashicorp/google"
            version = "~> 5"
        }
    }

    required_version = ">= 1.2.0"
    }

provider "aws" {
    region = var.aws_region
}

provider "google" {
    project = var.gcp_project_id
}

module "aws_instance" {
    source         = "./modules/aws_instance"
    ec2_ami        = var.aws_ami
    ec2_region     = var.aws_region
    instance_name  = var.aws_name
}

module "gcp_instance" {
    source         = "./modules/gcp_instance"
    image          = var.gcp_image
    instance_type  = var.gcp_instance_type
    instance_name  = var.gcp_instance_name
    zone           = var.gcp_zone
}