This is project to setup templates for github actions for both infrastructure and application. Setting this up prior to a project helps not to have to do it at the beginning of a project.

# Setup
The folowing things need to happen to setup this CI/CD pipeline.
1. Setup an OIDC Provider in AWS
2. Create a role for GitHub actions
4. Setup a backend for Terraform, otherwise the Terraform state files end up on the runner and then disappaer
3. Use a aws-actions/configure-aws-credentials@v4 action to get the AWS credentials

## Setup up a backend for Terraform

This uses Terraform to setup Terraform, and because this setup is required to run the Terraform code in GitHub Actions this code cannot be mixed with the core Terraform code. Hence the files for this setup are in: src/setup.
The backend is then configured in the terraform.tf file. Run the files in this folder to complete the setup. This creates two resources:
1. A Dynamodb table for locks
2. An S3 bucket for statefiles

Terraform destroy can then be used to remove the configuration.