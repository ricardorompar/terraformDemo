
output "aws_instance_id" {
  value = module.aws_instance.instance_id
}

output "aws_instance_public_ip" {
  value = module.aws_instance.instance_public_ip
}

output "gcp_instance_id" {
  value = module.gcp_instance.instance_id
}

output "gcp_instance_public_ip" {
  value = module.gcp_instance.instance_public_ip
}