# Cloud Resume Challenge


[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)
## Overview

This is my online CV created using automation and cloud. This static website also maintains a visitor counter which increases every time the page refreshes. This website can be built or pulled down with a single click. Following are the components/technologies have been used to built this:
- Terraform
- AWS
- Python
- HTML, CSS
- Shell script

## Architecture
#### Flow diagram

#### Description
- An HTML file (static site) with some CSS is stored in AWS S3 (Https is achieved using AWS Cloudfront) 
- A little bit Javsscript is used to call a rest api which is created using AWS API Gateway and lambda function.
- This Lambda function fetch and update the counter in a Database
- Database for this project is created using AWS Dynamo DB
- All the AWS services mentioned above are provisioned using Terraform 

#### Graph diagram

## Installation/Execution

You need an AWS account (No Cost involved, Free tier account is sufficient) and following software/applications installed in your system to built this:

- Terraform (Version 4.67.0 or higher)
- Git Bash (2.32.0 or higher)
- AWS CLI (2.13.30 or higher)

You can make replace the content of index.html to add your Profile/Site data and Execute following commands to make the site Up and Running:

```sh
git clone https://github.com/TheGaneshkumawat/ganesh-online-profile.git
cd ganesh-online-profile
./auto-create.sh
```

For Pulling the site (and all the components) down...

```sh
cd ganesh-online-profile
./auto-destroy.sh
```

## How it will look (End Result)


## Further Enhancements

- Usage of Modules
- Using more variable (for Bucket nam)
- Achieving CI/CD Using Github Actions
- Buying a domain name (and SSL certificate) and using AWS Route 53 to configure the same


## License

MIT
