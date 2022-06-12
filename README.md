# aws assume role for terraform


## Source Account (Account ID 000000000000)
- Create policy for IAM user to assume any role with "TF-" prefix in `target` account
- Create IAM user 'tfuser'
- Attach Policy to IAM user 'tfuser'


### to save terraform state in s3
- Create bucket
- Attach bucket policy with permissions for IAM user 'tfuser'



## Target Account (Account ID 111111111111)
- Create role with TRUST policy for Source AWS Account (trustpolicyforacct000000000000.json)
- Create policy to role providing permitted permissions for terraform activities in target account (s3policyforterraform.json)
- Attach policy to role





# references
[https://learn.hashicorp.com/tutorials/terraform/aws-assumerole](https://learn.hashicorp.com/tutorials/terraform/aws-assumerole)

[https://www.terraform.io/language/settings/backends/s3](https://www.terraform.io/language/settings/backends/s3)

[https://registry.terraform.io/providers/hashicorp/aws/latest/docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)