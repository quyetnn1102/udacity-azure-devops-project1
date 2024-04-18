# Azure Infrastructure Operations Project: Deploying a scalable IaaS web server in Azure
# Submitter: Quyet Nguyen

## Introduction
For this project, you will write a Packer template and a Terraform template to deploy a customizable, scalable web server in Azure.

## Getting Started
1. Clone this repository

2. Create your infrastructure as code

3. Update this README to reflect how someone would use your code.

## Dependencies
1. Create an [Azure Account](https://portal.azure.com) 
2. Install the [Azure command line interface](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest)
3. Install [Packer](https://www.packer.io/downloads)
4. Install [Terraform](https://www.terraform.io/downloads.html)

## Instructions
### 2.1. :heavy_check_mark: Navigate to your repository
### 2.2. :heavy_check_mark: Authenticate to Azure 
### 2.3. :heavy_check_mark: Deploy a policy
Create the Policy Definition:

```bash
az policy definition create --name "tagging-policy" --display-name "deny-creation-untagged-resources" --description "This policy ensures all indexed resources in your subscription have tags and deny deployment if it does not" --rules ./project1-tagging-policy.json --mode "All"
```

### 2.4. :heavy_check_mark: Create the Policy Assignment
```bash
az policy assignment create --name 'tagging-policy' --display-name "deny-creation-untagged-resources" --policy tagging-policy
```

### 2.5. :heavy_check_mark: List the policy assignments to verify

```bash
az policy assignment list
```

### 2.6. :heavy_check_mark: Create a Server Image with Packer
Get your azure variables

✔️ Get Subscription ID
- Login into your azure account
- Search and click "Subscriptions"
- Select whichever subscriptions are needed
- Click on the overview
- Copy the Subscription Id

✔️ Get Client ID
- Login into your azure account
- Search and click "Azure Active Directory"
- Click "App registrations" under the Manage tab
- Click the application that you own
- Copy the client ID

✔️ Get Client Secret
- Login into your azure account
- Search and click "Azure Active Directory"
- Click "App registrations" under the Manage tab
- Click the application that you own
- Click the "Certificates & Secrets" under the Manage tab
- Create a client secret as you need.

Fill in variables section in the server.json file:

`"variables": {
   "client_id": "",
   "client_secret": "",
   "subscription_id": "" 
 }
`

Create image

```bash 
packer build server.json
```


View Images

```bash 
az image list
```

### 2.7. :heavy_check_mark: Create the infrastructure with Terraform Template

Our Terraform template will allow us to reliably create, update, and destroy our infrastructure

Customize vars.tf

Variables from vars.tf are called from mains.tf, for example the variable prefix is called as:

```
${var.prefix}
```

In vars.tf, the description and value is assigned in the following manner:

```
variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
  default = "azure-devops-project1"
}
```

See all variable in vars.tf

### 2.8. :heavy_check_mark: Deploy infrastructure

1. Initializing Working Directories

```bash 
terraform init
```

2. Create infrastructure plan
```bash 
terraform plan -out solution.plan
```

3. Deploy the infrastructure plan

```bash  
terraform apply "solution.plan"
```

4. View infrastructure

```bash  
terraform show
```


5. Destroy infrastructure (when completed)

```bash 
terraform destroy
```

6. Delete images(when completed)

```bash 
az image delete -g udacity-thoanvtt-project-1-rg -n myPackerImage
```



## :heavy_check_mark: Output
#### We will show all of logs for the command below

```bash 
az policy assignment list
az image list
terraform plan -out solution.plan
terraform apply "solution.plan"
terraform show
```

