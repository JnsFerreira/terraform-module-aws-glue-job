variable "name" {
  type        = string
  description = "Glue job name"
}

variable "description" {
  type        = string
  description = "Glue job description."
  default     = null
}

variable "glue_version" {
  type        = string
  description = "(Optional) The version of Glue to use."
  default     = "4.0"

  validation {
    condition     = contains(["2.0", "3.0", "4.0"], var.glue_version)
    error_message = "This Glue version is not accepted. It's either invalid or deprecated"
  }
}

variable "role_arn" {
  type        = string
  description = "The ARN of the IAM role associated with this job."
}

variable "worker_type" {
  type        = string
  description = "(Optional) The type of predefined worker that is allocated when a job runs. Accepts a value of Standard, G.1X, or G.2X"
  default     = null
}

variable "number_of_workers" {
  type        = number
  description = "(Optional) The number of workers of a defined workerType that are allocated when a job runs."
  default     = null
}

variable "max_capacity" {
  type        = number
  description = "(Optional) The maximum number of AWS Glue data processing units (DPUs) that can be allocated when this job runs."
  default     = null
}

variable "timeout" {
  type        = number
  description = "(Optional) The job timeout in minutes. The default is 2880 minutes (48 hours)."
  default     = 2880
}

variable "max_retries" {
  type        = number
  description = "(Optional) The maximum number of times to retry this job if it fails."
  default     = null
}

variable "connections" {
  type        = list(string)
  description = "(Optional) The list of connections used for this job."
  default     = null
}

variable "default_arguments" {
  type        = map(string)
  description = " (Optional) The map of default arguments for this job. You can specify arguments here that your own job-execution script consumes, as well as arguments that AWS Glue itself consumes."
  default     = null
}

variable "non_overridable_arguments" {
  type        = map(string)
  description = "(Optional) Non-overridable arguments for this job, specified as name-value pairs."
  default     = null
}

variable "security_configuration" {
  type        = string
  description = "The name of the Security Configuration to be associated with the job."
  default     = null
}

variable "command" {
  type = object({
    name            = optional(string, null)
    script_location = optional(string, null)
    python_version  = number
  })
  description = "The command of the job."
}

variable "execution_property" {
  type = object({
    max_concurrent_runs = number
  })
  description = "(Optional) Execution property of the job. Defined below."
  default     = null
}

variable "notification_property" {
  type = object({
    notify_delay_after = number
  })
  description = "(Optional) Notification property of the job."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Key-value mapping of resource tags"
}