# Terraform

Terraform is an open-source infrastructure as code software tool that provides a consistent CLI workflow to manage hundreds of cloud services. Terraform codifies cloud APIs into declarative configuration files.

### Install
check the terraform documentation [Installation](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)

### Build
check the terraform documentation [Build](https://learn.hashicorp.com/tutorials/terraform/install-cli?in=terraform/aws-get-started)

### Authentication

The AWS provider offers a flexible means of providing credentials for authentication. The following methods are supported, in this order, and explained below:

- Static credentials
- Environment variables
- Shared credentials/configuration file
- CodeBuild, ECS, and EKS Roles
- EC2 Instance Metadata Service (IMDS and IMDSv2)

Actually terraform takes the credentials for the credentials file of aws in the route C:\Users\Usuario\\.aws.

Terraform takes de aws_access_key_id and aws_secret_access_key

check the terraform documentation [Authentication](https://www.terraform.io/docs/cli/auth/index.html)

### First usage

in the directory /terraform run the next commands:

```
terraform init
terraform workspace select <name_workspace>
```

### Commands

| command | description |
| ------ | ------ |
| init | Prepare your working directory for other commands |
| validate | Check whether the configuration is valid |
| plan | Show changes required by the current configuration |
| apply | Create or update infrastructure|
| destroy| Destroy previously-created infrastructure |
| workspace select| select the workspace |

we use commonly the commands:

```
terraform apply -var-file=env.<name_workspace>.tfvars
terraform plan -var-file=env.<name_workspace>.tfvars
terraform destroy -var-file=env.<name_workspace>.tfvars
terraform workspace select <name_workspace>
```

the flag -var-file=env.qa.tfvars indicates to terraform where is the values of the variables. 


check the terraform documentation [Commands](https://www.terraform.io/docs/cli/commands/index.html)

### Language
The main purpose of the Terraform language is declaring resources.
The syntax of the Terraform language consists of only a few basic elements:

```
<BLOCK TYPE> "<BLOCK LABEL>" "<BLOCK LABEL>" {
  # Block body
  <IDENTIFIER> = <EXPRESSION> # Argument
}
```

Example:

```
resource "aws_vpc" "main" {
  cidr_block = var.base_cidr_block
}
```

check the terraform documentation [language](https://www.terraform.io/docs/language/index.html)

###  Override Files

Terraform normally loads all of the .tf and .tf.json files within a directory and expects each one to define a distinct set of configuration objects. If two files attempt to define the same object, Terraform returns an error.

Our files names .tf has the next structure:

```
 <name_resource>_resources.tf
```
Example:

```
 s3_resources.tf
 cloudfront_resources.tf
```

Our file main.tf is the principal file and has the provider and definition of backend.

check the terraform documentation [Files](https://www.terraform.io/docs/language/files/override.html)

### Providers

Terraform relies on plugins called "providers" to interact with remote systems.

Terraform configurations must declare which providers they require so that Terraform can install and use them. Additionally, some providers require configuration (like endpoint URLs or cloud regions) before they can be used.

Examples:

```
provider "google" {
  project = "acme-app"
  region  = "us-central1"
}
```

```
provider "aws" {
  region = var.region
}
```

In the project we just use the provider of aws.

check the terraform documentation [Providers](https://www.terraform.io/docs/language/providers/index.html)


### Variables

The Terraform language includes a few kinds of blocks for requesting or publishing named values.

Declaring an Input Variable:

```
variable "availability_zone_names" {
  type    = list(string)
}
```

Give a value to that variable we just defined:

```
availability_zone_names = ["us-east-1"]
```

Variable Definitions (.tfvars) Files:

To set lots of variables, it is more convenient to specify their values in a variable definitions file (with a filename ending in either .tfvars or .tfvars.json) and then specify that file on the command line with -var-file:

```
terraform apply -var-file="testing.tfvars"
```

Our project has the next file where is the definitios of the variables:

```
define-variables.tf
```

and the files where is the values of the variables, but divided for enviroments:

```
env.qa.tfvars
evn.pdn.tfvars
```

check the terraform documentation [Variables](https://www.terraform.io/docs/language/values/index.html)
