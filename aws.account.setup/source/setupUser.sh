aws iam create-policy --policy-name AssumeTFRole --policy-document file://AssumeTFRolePolicy.json

aws iam create-user --user-name tfuser

aws iam attach-user-policy --user-name tfuser --policy-arn "arn:aws:iam::000000000000:policy/AssumeTFRole"

aws iam create-access-key --user-name tfuser
