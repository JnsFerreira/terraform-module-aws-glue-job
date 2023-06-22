output "arn" {
  description = "AWS Glue job ARN"
  value       = aws_glue_job.this.arn
}

output "name" {
  description = "AWS Glue job name"
  value       = aws_glue_job.this.name
}