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