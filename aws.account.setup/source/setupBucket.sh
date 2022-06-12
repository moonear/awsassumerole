
# Set up bucket to hold terraform state remotely
aws s3 mb s3://tfstatebucket999999999999999999999999999999999999

aws s3api put-bucket-policy --bucket tfstatebucket999999999999999999999999999999999999 --policy file://s3bucket.remotestate.json