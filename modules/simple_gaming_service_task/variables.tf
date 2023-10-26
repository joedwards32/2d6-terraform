variable "name" {
  description = "Desired task name"
  type        = string
}

variable "container_image" {
  description = "Container image"
  type        = string
}

variable "sgs_cluster_id" {
  description = "Simple Gaming Service ECS cluster ID"
  type        = string
}

variable "efs_client_security_group_id" {
  description = "Security Group ID for EFS Clients"
  type        = string
  default     = null
}

variable "cpu" {
  description = "Fargate CPU units"
  type        = number
  default     = 512
}

variable "memory" {
  description = "Fargate Memory units"
  type        = number
  default     = 1024
}

variable "disk" {
  description = "Fargate ephemeral storage GiB"
  type        = number
  default     = 21
}

variable "running" {
  description = "Whether task should be running or not"
  type        = bool
  default     = true
}

variable "logging_region" {
  description = "AWS region"
  type        = string
}

variable "dns_zone" {
  description = "AWS Route53 DNS zone to create A record in"
  type        = string
}

variable "execution_role_arn" {
  description = "ARN of ECS execution role for task"
  type        = string
}

variable "port_mappings" {
  description = "Array of json port definitions"
  type        = list(object({
    hostPort = number
    containerPort = number
    protocol = string
  }))
}

variable "environment_variables" {
  description = "Array of environment variables"
  type        = list(object({
    name = string
    value = string
  }))
  default = []
}

variable "mount_points" {
  description = "Array of environment variables"
  type        = list(object({
    containerPath = string
    sourceVolume = string
  }))
  default = []
}

variable "efs_file_systems" {
  description = "List of objects representing EFS file systems to create and paths to mount them"
  type        = list(object({
    name = string
    efs_file_system_id = string
    mount_point = string
  }))
  default = []
}
