output "arn" {
  value = aws_ecs_cluster.sgs.arn
}

output "id" {
  value = aws_ecs_cluster.sgs.id
}

output "execution_role_arn" {
  value = aws_iam_role.ecs_role.arn
}
