# Azure Infrastructure Operations Project: Deploying a scalable IaaS Web Server in Azure
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
### 2.2. :heavy_check_mark: Authenticate to Azure the open Azure portal Bash Cloud Shell to upload `project1-tagging-policy.json`

### 2.3. :heavy_check_mark: Deploy a policy
Create the Policy Definition:

```bash
az policy definition create --name 'tagging-policy' --display-name 'deny-creation-untagged-resources' --description 'This policy ensures all indexed resources in your subscription have tags and deny deployment if they do not' --rules ./project1-tagging-policy.json  --mode All
```

### 2.4. :heavy_check_mark: Create the Policy Assignment
```bash
az policy assignment create --name 'tagging-policy' --display-name 'deny-creation-untagged-resources' --policy tagging-policy
```

### 2.5. :heavy_check_mark: List the policy assignments to verify

```bash
az policy assignment list
```
![alt text](images\azpolicyassignmentlist.png)

### 2.6. :heavy_check_mark: Create a Server Image with Packer

✔️ Open Azure portal Bash Cloud Shell then upload  `server.json`


✔️ Create a Server Image using below packer command

```bash 
packer build server.json
```
![alt text](images\packagebuildsuccess.png)

✔️ View Images

```bash 
az image list
```
![alt text](images\azureimagelist.png)

### 2.7. :heavy_check_mark: Create the infrastructure with Terraform Template

Go to folder `cd project1-IaC/`

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

![alt text](images\terraform_solution_plan.png)

3. Deploy the infrastructure plan

```bash  
terraform apply "solution.plan"
```

![alt text](images\terraform_apply_solution.png)

4. View infrastructure

```bash  
terraform show
```

![alt text](images\terraform_show.png)


Azure Portal Azuredevops resource created by terraform
✔️ View in Azure Portal
![alt text](images\azureportaloutput.png)


5. Destroy infrastructure (when completed)

```bash 
terraform destroy
```

6. Delete images(when completed)

```bash 
az image delete -g Azuredevops -n MyPackerImage
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

