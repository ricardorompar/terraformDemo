variable "image" {
  description = "The image used for the Compute Engine instance. Default: Ubuntu 22.04 x86"
  type        = string
  default = "ubuntu-2204-jammy-v20240519"
}

variable "instance_type" {
  description = "The type of instance to create"
  type        = string
  default = "e2-micro"
}

variable "instance_name" {
  description = "Name of the compute engine instance"
  type        = string
  default = "computeengine"
}

variable "zone" {
  description = "The zone to deploy the instance in"
  type        = string
  default = "us-central1-a"
}