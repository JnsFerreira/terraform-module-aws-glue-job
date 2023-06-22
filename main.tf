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

  command {
    name            = var.command.name
    python_version  = var.command.python_version
    script_location = var.command.script_location
  }

  dynamic "notification_property" {
    count = var.notification_property != null ? 1 : 0

    content {
      notify_delay_after = var.notification_property.notify_delay_after
    }
  }

  dynamic "execution_property" {
    count = var.execution_property  != null ? 1 : 0
    content {
      max_concurrent_runs = var.execution_property.max_concurrent_runs
    }
  }

  tags = var.tags
}
