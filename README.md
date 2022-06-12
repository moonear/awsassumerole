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

## Terraform Docker Image 
- set appropriate values in file `s3.tfbackend` to store/access s3 backend
- set appropriate aws role in file `terraform.tfvars`
- Create Access keys for IAM user 'tfuser'
- set access keys in environment
- pull docker image for terraform
- run terraform docker image with env variables and mounting tf directory

```bash
export ACCESS_KEY=
export SECRET_ACCESS_KEY=

docker pull hashicorp/terraform:1.2.2

docker run -it --mount type=bind,source="$(pwd)/tf",target=/tf \
  -w /tf \
  -e AWS_ACCESS_KEY_ID=$ACCESS_KEY \
  -e AWS_SECRET_ACCESS_KEY=$SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=us-west-2 \
  hashicorp/terraform:1.2.2 init -backend-config="s3.tfbackend"

docker run -it --mount type=bind,source="$(pwd)/tf",target=/tf \
  -w /tf \
  -e AWS_ACCESS_KEY_ID=$ACCESS_KEY \
  -e AWS_SECRET_ACCESS_KEY=$SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=us-west-2 \
  hashicorp/terraform:1.2.2 validate

docker run -it --mount type=bind,source="$(pwd)/tf",target=/tf \
  -w /tf \
  -e AWS_ACCESS_KEY_ID=$ACCESS_KEY \
  -e AWS_SECRET_ACCESS_KEY=$SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=us-west-2 \
  hashicorp/terraform:1.2.2 plan

docker run -it --mount type=bind,source="$(pwd)/tf",target=/tf \
  -w /tf \
  -e AWS_ACCESS_KEY_ID=$ACCESS_KEY \
  -e AWS_SECRET_ACCESS_KEY=$SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=us-west-2 \
  hashicorp/terraform:1.2.2 apply -auto-approve

docker run -it --mount type=bind,source="$(pwd)/tf",target=/tf \
  -w /tf \
  -e AWS_ACCESS_KEY_ID=$ACCESS_KEY \
  -e AWS_SECRET_ACCESS_KEY=$SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=us-west-2 \
  hashicorp/terraform:1.2.2 state list

docker run -it --mount type=bind,source="$(pwd)/tf",target=/tf \
  -w /tf \
  -e AWS_ACCESS_KEY_ID=$ACCESS_KEY \
  -e AWS_SECRET_ACCESS_KEY=$SECRET_ACCESS_KEY \
  -e AWS_DEFAULT_REGION=us-west-2 \
  hashicorp/terraform:1.2.2 apply -destroy -auto-approve

```

# Other Considerations

## s3 backend versioning

## state locking [https://www.terraform.io/language/settings/backends/s3#dynamodb-table-permissions](https://www.terraform.io/language/settings/backends/s3#dynamodb-table-permissions)

## sts:SourceIdentity & sts:RoleSessionName [https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_permissions-to-switch.html](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_roles_use_permissions-to-switch.html)

## create image with pre-installed plugins [https://learn.hashicorp.com/tutorials/terraform/automate-terraform](https://learn.hashicorp.com/tutorials/terraform/automate-terraform)


# references
[https://learn.hashicorp.com/tutorials/terraform/aws-assumerole](https://learn.hashicorp.com/tutorials/terraform/aws-assumerole)

[https://www.terraform.io/language/settings/backends/s3](https://www.terraform.io/language/settings/backends/s3)

[https://registry.terraform.io/providers/hashicorp/aws/latest/docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)