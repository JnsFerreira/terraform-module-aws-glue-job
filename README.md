# terraform-module-aws-glue-job

Terraform module to create AWS Glue Jobs


## Basic Usage

```terraform
module "glue_job" {
  source = "https://github.com/JnsFerreira/terraform-module-aws-glue-job?ref=v1.0.0"

  name        = "my-glue-job"
  description = "Glue Job that runs data_cleaning.py Python script"
  role_arn    = local.role_arn

  command = {
    script_location = "data_cleaning.py"
  }
}
```
