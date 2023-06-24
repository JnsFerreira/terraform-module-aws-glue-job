locals {
  role_arn = aws_iam_role.glue_job_role.arn
}

resource "aws_iam_policy" "glue_job_policy" {
  name        = "${var.name}_policy"
  path        = "/"
  description = "IAM policy for ${var.name} glue job"
  policy      = var.iam_policy
}

resource "aws_iam_role" "glue_job_role" {
  name        = "${var.name}_role"
  description = "IAM role for ${var.name} glue job"

  assume_role_policy = <<EOF
    {
      "Version": "2012-10-17",
      "Statement": [
        {
          "Effect": "Allow",
          "Principal": {
            "Service": "glue.amazonaws.com"
          },
          "Action": "sts:AssumeRole"
        }
      ]
    }
    EOF
}

resource "aws_iam_policy_attachment" "this" {
  name       = "attach_glue_policy"
  roles      = aws_iam_role.glue_job_role.arn
  policy_arn = aws_iam_policy.glue_job_policy.arn
}

resource "aws_glue_job" "this" {
  name                      = var.name
  description               = var.description
  glue_version              = var.glue_version
  role_arn                  = local.role_arn
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
    for_each = var.notification_property != null ? [true] : []

    content {
      notify_delay_after = var.notification_property.notify_delay_after
    }
  }

  dynamic "execution_property" {
    for_each = var.execution_property != null ? [true] : []
    content {
      max_concurrent_runs = var.execution_property.max_concurrent_runs
    }
  }

  tags = var.tags
}
