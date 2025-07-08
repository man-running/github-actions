# Subnet outputs
output "subnet_public_id_1" {
    description = "The ID of the first public subnet"
    value     = aws_subnet.public_subnet_1.id
}

output "subnet_public_id_2" {
  description = "The ID of the second public subnet"
  value       = aws_subnet.public_subnet_2.id
}

output "subnet_private_id" {
    description = "The ID of the private subnet"
    value = aws_subnet.private_subnet.id
}

# Route53 outputs
output "name_servers" {
    value = aws_route53_zone.main.name_servers
}

output "route53_zone_id" {
    value = aws_route53_zone.main.zone_id
}

# VPC output
output "vpc_id" {
    value = aws_vpc.vpc_core.id
}

output "vpc_core_cidr" {
  value = aws_vpc.vpc_core.cidr_block
}