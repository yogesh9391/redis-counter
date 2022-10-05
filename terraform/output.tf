output "node_security_group_id" {
  value = module.counter_app_eks.node_security_group_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.counter_app_vpc.private_subnets
}
