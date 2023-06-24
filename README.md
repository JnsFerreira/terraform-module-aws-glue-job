# terraform-module-aws-glue-job

Terraform module to create AWS Glue Jobs


## Basic Usage

```terraform
locals {
  iam_policy = file("iac/iam/policies/policy.json")
}

module "glue_job" {
  source = "git::https://github.com/JnsFerreira/terraform-module-aws-glue-job?ref=main"

  name        = "my-glue-job"
  description = "Glue Job that runs data_cleaning.py Python script"
  iam_policy  = local.iam_policy

  command = {
    script_location = "data_cleaning.py"
  }
}
```
