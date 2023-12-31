#!/bin/bash


start=$SECONDS

terraform -chdir=dynamoDB init
terraform -chdir=dynamoDB destroy -auto-approve

printf "\n\033[7;31mWAITING 5 SECONDS FOR Database TO Delete......\033[0m\n\n"
sleep 3

printf "\n\033[7;31mDB Deleted!!!......\033[0m\n\n"

terraform -chdir=lambda init
terraform -chdir=lambda destroy -auto-approve

printf "\n\033[7;31mWAITING 5 SECONDS FOR Lambda Function TO Delete......\033[0m\n\n"
sleep 3

printf "\n\033[7;31mLambda function Deleted!!!......\033[0m\n\n"


sleep 3

terraform -chdir=s3 init
terraform -chdir=s3 destroy -auto-approve

sed -i -e "s/fetch(.*/fetch('LAMBDA_API_URL')/g" ./assets/html/index.html


printf "\n\033[7;31mWAITING 5 SECONDS FOR S3 Bucket TO Delete......\033[0m\n\n"
sleep 3

printf "\n\033[7;31m S3 Bucket Deleted!!!......\033[0m\n\n"

printf "\n\033[7;32mPROCESS COMPLETE! \033[0m"
echo
printf "\nTime to complete = %s seconds" "$SECONDS"
echo

