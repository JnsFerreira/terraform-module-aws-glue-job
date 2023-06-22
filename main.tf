resource "aws_glue_job" "this" {
  name                      = var.name
  description               = var.description
  glue_version              = var.glue_version
  role_arn                  = var.role_arn
  worker_type               = var.worker_type
  number_of_workers         = var.number_of_workers
  max_capacity              = var.max_capacity
  timeout                   = var.timeout
  max_retries               = var.max_retries
  connections               = var.connections
  default_arguments         = var.default_arguments
  non_overridable_arguments = var.non_overridable_arguments
  security_configuration    = var.security_configuration
}
