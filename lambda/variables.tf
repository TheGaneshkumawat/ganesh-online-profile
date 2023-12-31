variable "lambda_assume_policy_path" {
  description = "Path for assume policy location"
  type = string
  default = "../assets/iam/lambda-assume-policy.json"
}

variable "lambda_policy_path" {
  description = "Path for assume policy location"
  type = string
  default = "../assets/iam/lambda-policy.json"
}