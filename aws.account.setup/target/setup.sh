
# Create the role and attach the trust policy file that allows users in the specified account to assume the role.
aws iam create-role --role-name TF-UserAccess-Role --assume-role-policy-document file://trustpolicyforacct000000000000.json

aws iam create-policy --policy-name S3PolicyForTerraform --policy-document file://s3policyforterraform.json

aws iam attach-role-policy --role-name TF-UserAccess-Role --policy-arn arn:aws:iam::111111111111:policy/S3PolicyForTerraform
