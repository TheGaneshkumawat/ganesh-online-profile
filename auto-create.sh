#!/bin/bash


start=$SECONDS

terraform -chdir=dynamoDB init
terraform -chdir=dynamoDB apply -auto-approve

printf "\n\033[7;31mWAITING 5 SECONDS FOR Database TO INITIALIZE......\033[0m\n\n"
sleep 3

printf "\n\033[7;31mDB CREATED!!!......\033[0m\n\n"

terraform -chdir=lambda init
terraform -chdir=lambda apply -auto-approve

printf "\n\033[7;31mWAITING 5 SECONDS FOR Lambda Function TO INITIALIZE......\033[0m\n\n"
sleep 3

printf "\n\033[7;31mLambda function CREATED!!!......\033[0m\n\n"


export API_URL=$(terraform -chdir=lambda output -raw base_url)

printf "\n\033[7;31mAPI URL - $API_URL\033[0m\n\n"

sed -i -e "s#LAMBDA_API_URL#$API_URL#" ./assets/html/index.html

printf "\n\033[7;31mS3 API URL Updated!!!......\033[0m\n\n"

sleep 3

terraform -chdir=s3 init
terraform -chdir=s3 apply -auto-approve


printf "\n\033[7;31mWAITING 5 SECONDS FOR S3 Bucket TO INITIALIZE......\033[0m\n\n"
sleep 3

printf "\n\033[7;31m S3 Bucket CREATED!!!......\033[0m\n\n"

export SITE_URL=$(terraform -chdir=s3 output -raw website_url)

printf "\n\033[7;31mURL to access the site - ${SITE_URL}\033[0m\n\n"


printf "\n\033[7;32mPROCESS COMPLETE! \033[0m"
echo
printf "\nTime to complete = %s seconds" "$SECONDS"
echo
