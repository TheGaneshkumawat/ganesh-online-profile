# Cloud Resume Challenge


## Overview

This is my online CV created using automation and cloud. This static website also maintains a visitor counter which increases every time the page refreshes. This website can be built or pulled down with a single click. Following are the components/technologies have been used to built this:
- Terraform
- AWS
- Python
- HTML, CSS
- Shell script

## Architecture
#### Flow diagram
![alt text](https://github.com/TheGaneshkumawat/ganesh-online-profile/blob/main/screens/architecture.jpg)

#### Description
- An HTML file (static site) with some CSS is stored in AWS S3 (Https is achieved using AWS Cloudfront) 
- A little bit Javsscript is used to call a rest api which is created using AWS API Gateway and lambda function.
- This Lambda function fetch and update the counter in a Database
- Database for this project is created using AWS Dynamo DB
- All the AWS services mentioned above are provisioned using Terraform 

#### Graph diagram
![alt text](https://github.com/TheGaneshkumawat/ganesh-online-profile/blob/main/screens/graph.jpg)

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
![alt text](https://github.com/TheGaneshkumawat/ganesh-online-profile/blob/main/screens/output.gif)
![alt text](https://github.com/TheGaneshkumawat/ganesh-online-profile/blob/main/screens/1.JPG)
![alt text](https://github.com/TheGaneshkumawat/ganesh-online-profile/blob/main/screens/2.JPG)
![alt text](https://github.com/TheGaneshkumawat/ganesh-online-profile/blob/main/screens/3.JPG)

## Further Enhancements

- Usage of Modules
- Using more variable (for Bucket name)
- Achieving CI/CD Using Github Actions
- Buying a domain name (and SSL certificate) and using AWS Route 53 to configure the same


## License

Free
