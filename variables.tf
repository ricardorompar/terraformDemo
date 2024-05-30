variable "aws_name" {
    description = "Value of the Name tag for the EC2 instance"
    type        = string
    default     = "ExampleEC2"
}

variable "aws_region" {
    description = "Region for the EC2 instance. Europe - Ireland"
    type        = string
    default     = "eu-west-1"
}

variable "aws_ami" {
    description = "Machine image ID for EC2: Ubuntu 22.04"
    type        = string
    default     = "ami-0607a9783dd204cae"
}

variable "gcp_image" {
  description = "The image used for the Compute Engine instance. Default: Ubuntu 22.04 x86"
  type        = string
  default = "ubuntu-2204-jammy-v20240519"
}

variable "gcp_instance_type" {
  description = "The type of instance to create"
  type        = string
  default = "e2-micro"
}

variable "gcp_instance_name" {
  description = "Name of the compute engine instance"
  type        = string
  default = "exampleinstance"
}

variable "gcp_zone" {
  description = "The zone to deploy the instance in"
  type        = string
  default = "us-central1-a"
}

variable "gcp_project_id" {
    description = "GCP project ID"
    type        = string
    default = "terraformdemo-424820"
}