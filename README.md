# aws assume role for terraform

Proof of concept

For simplification, all operations within a single AWS Account.
todo: Next step, provision role in another aws account

- Create a policy for IAM User (iam.developer.policy.json).
- Create a policy for Role (role.developer.policy.json)
- Create role (DeveloperRole) with Trusted entity type AWS Account, attach policy role.developer.policy.json
- Create a IAM User 'iamdeveloper' with programatic access, attach iam.developer.policy.json
- aws configure for default profile
- terraform init/validate/plan/apply/destroy using assume role



# references

[https://learn.hashicorp.com/tutorials/terraform/aws-assumerole](https://learn.hashicorp.com/tutorials/terraform/aws-assumerole)
