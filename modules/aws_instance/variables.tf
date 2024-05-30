variable "instance_name" {
    description = "Value of the Name tag for the EC2 instance"
    type        = string
    default     = "ExampleEC2"
}

variable "ec2_region" {
    description = "Region for the EC2 instance. Europe - Ireland"
    type        = string
    default     = "eu-west-1"
}

variable "ec2_ami" {
    description = "Machine image ID for EC2: Ubuntu 22.04"
    type        = string
    default     = "ami-0607a9783dd204cae"
}