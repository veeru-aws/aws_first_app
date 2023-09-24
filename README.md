# aws_first_app

How to Install and Setup Terraform on Windows Machine step by step

https://automateinfra.com/2021/05/02/how-to-install-terraform-on-windows-machine/

Terraform work space:
https://app.terraform.io/app/veeru_aws/workspaces/AWS_FIRST_APP

Note: access key and Secret key saved as variable in terraform
What is Terraform?
Terraform is a tool for building, versioning, and changing the infrastructure. Terraform is Written in GO Language, and the syntax language of configuration files is HashiCorp configuration language(HCL) which is much easier than yaml or json.

Terraform is used with various cloud providers such as Amazon AWS, Oracle, Microsoft Azure, Google Cloud, etc.

Prerequisites
Any Windows Machine should work but this tutorial will use Windows 10 Machine.
Notepad or Notepad ++ or Visual Studio code editor on your windows Machine to create terraform configuration files. To install visual code studio click here.
Related: How to Install Terraform on an Ubuntu machine

How to Install Terraform on a Windows machine
Now that you have a basic idea about terraform let’s kick off this tutorial by first installing terraform on a Windows machine.

First open your favorite browser and download the appropriate version of Terraform from HashiCorp’s download Page. This tutorial will download terraform 0.13.0 version but you will find latest versions on the Hashicorps download page.
Downloading Terraform from Hashicorp website
Downloading Terraform from Hashicorp website
Make a folder on your C:\ drive where you can put the Terraform executable something Like  C:\tools where you can put binaries.
Downloading Terraform binary on the local machine
Downloading Terraform binary on the local machine
Extract the zip file to the folder C:\tools
Extracting the Terraform binary executable
Extracting the Terraform binary executable
Now Open your Start Menu and type in “environment” and the first thing that comes up should be Edit the System Environment Variables option. Click on that and you should see this window.
Editing the System Environment Variables option.
Editing the System Environment Variables option.
Now under System variables look for Path and edit it.
Editing the Path with Terraform binary location
Editing the Path with Terraform binary location
Click New and add the folder path where terraform.exe is located to the bottom of the list. By adding the terraform.exe in PATH will allow you to execute terraform command from anywhere in the system.
Updating the Windows Path with Terraform binary location
Updating the Windows Path with Terraform binary location
Click OK on each of the menus and further open command prompt or PowerShell to check if terraform is properly added in PATH by running the command terraform from any location.
Terraform command on command Prompt in Windows Machine
Terraform command on command Prompt in Windows Machine
Terraform command on PowerShell in Windows Machine 
Terraform command on PowerShell in Windows Machine
Verify the installation was successful by entering terraform --version. If it returns a version, you’re good to go.
Running the terraform --version command
Running the terraform –version command
Creating an IAM user in AWS account with programmatic access
There are two ways to connect to an AWS account, the first is providing a username and password on the AWS login page and another is configuring the Access key ID and secret keys of IAM users in AWS CLI to connect programmatically.

Earlier, you installed AWS CLI successfully on a Windows machine, but you will need an IAM user with programmatic access to run commands from it.

Advertisements

REPORT THIS AD
Let’s learn how to create an IAM user in an AWS account with programmatic access, Access key ID, and secret keys.

Open your favorite web browser and navigate to the AWS Management Console and log in.
While in the Console, click on the search bar at the top, search for ‘IAM’, and click on the IAM menu item.
Checking the IAM AWS service
Checking the IAM AWS service
To Create a user click on Users→ Add user and provide the name of the user myuser and make sure to tick the Programmatic access checkbox in Access type which enables an access key ID and secret access key and then hit the Permissions button.
Adding the IAM user in AWS CLoud
Adding the IAM user in AWS CLoud
Now select the “Attach existing policies directly” option in the set permissions and look for the “Administrator” policy using filter policies in the search box. This policy will allow myuser to have full access to AWS services.
Attaching the admin rights to IAM user in AWS CLoud
Attaching the admin rights to IAM users in AWS CLoud
Finally click on Create user.
Now, the user is created successfully and you will see an option to download a .csv file. Download this file which contains IAM users i.e. myuser Access key ID and Secret access key which you will use later in the tutorial to connect to AWS service from your local machine.
Downloading the AWS credentials of IAM user 
Downloading the AWS credentials of IAM user
Configure AWS credentials using aws configure in AWS CLI
You are an IAM user with Access key ID and secret keys, but AWS CLI cannot perform anything unless you configure AWS credentials. Once you configure the credentials, AWS CLI allows you to connect to the AWS account and execute commands.

Configure AWS Credentials by running the aws configure command on command prompt.
1
aws configure
Enter the details such as AWS Access key ID, Secret Access Key, region. You can skip the output format as default or text or json .
Configure AWS CLI using aws configure command
Configure AWS CLI using aws configure command
Once AWS is configured successfully , verify by navigating to C:\Users\YOUR_USER\.aws  and see if two file credentials and config are present.
Checking the credentials file and config on your machine
Checking the credentials file and config on your machine
Now open both the files and verify and you can see below you’re AWS credentials are configured successfully using aws configure.
Checking the config file on your machine
Checking the config file on your machine
Checking the config file on your machine
Checking the config file on your machine
Verify aws configure from AWS CLI by running a simple commands
Now, you can test if AWS Access key ID, Secret Access Key, region you configured in AWS CLI is working fine by going to command prompt and running the following commands.

1
aws ec2 describe-instances
Describing the AWS EC2 instances using AWS CLI
Describing the AWS EC2 instances using AWS CLI
You can also verify the AWS CLI by listing the buckets in your acount by running the below command.
1
aws cli s3
Creating AWS EC2 Instance Using Terraform
In this demonstration, you will learn how to create Amazon Web Service (AWS) EC2 instance using Terraform commands on a Windows machine. Lets dive in.

First, create a folder Terraform-EC2-simple-demo on your desktop or any location on Windows Machine.
Now create a file main.tf inside the folder you’re in and copy/paste the below content.
1
2
3
4
5
resource "aws_instance" "my-machine" {          # This is Resource block where we define what we need to create
 
  ami = var.ami                                 # ami is required as we need ami in order to create an instance
  instance_type = var.instance_type             # Similarly we need instance_type
}
Create one more file named vars.tf file under Terraform-EC2-simple-demo folder and copy/paste the content below. The vars.tf file contains the variables that you referred in main.tf file.
1
2
3
4
5
6
7
variable "ami" {                       # We are declaring the variable ami here which we used in main.tf
  type = string      
}
 
variable "instance_type" {             # We are declaring the variable instance_type here which we used in main.tf
  type = string 
}
To select the the image ID ( ami ), navigate to the LaunchInstanceWizard and search for ubuntu in the search box to get all the ubuntu image IDs. This tutorial will use Ubuntu Server 18.04.LTS image.

Choosing the Amazon Machine Image
Choosing the Amazon Machine Image
Create one more file output.tf file under Terraform-EC2-simple-demomo folder and paste the content below. This file will allow Terraform to display he output after running terraform apply command.
1
2
3
output "ec2_arn" {
  value = aws_instance.my-machine.arn    
}  
Create provider.tf file under Terraform-EC2-simple-demo folder and paste the content below.
1
2
3
provider "aws" {     # Defining the Provider Amazon  as we need to run this on AWS  
  region = "us-east-2"
}
Create terraform.tfvars file under Terraform-EC2-simple-demo folder and paste the content below. This file contains the value of Terraform vaiables declared in vars.tf file.
1
2
ami = "ami-013f17f36f8b1fefb" 
instance_type = "t2.micro"
Now your files and code are ready for execution and the folder structure should look something like below.
 folder structure of terraform configuration files
folder structure of terraform configuration files
Now your files and code are ready for execution. Initialize the terraform using the terraform init command.
1
terraform init
Initializing the terraform using the terraform init command. 
Initializing the terraform using the terraform init command.
Terraform initialized successfully , now its time to run the plan command which provides you the details of the deployment. Run terraform plan command to confirm if correct resources is going to provisioned or deleted.
1
terraform plan
Running the terraform plan command
Running the terraform plan command
After verification, now its time to actually deploy the code using terraform apply command.
1
terraform apply
Running the terraform apply command
Running the terraform apply command
Great Job; terraform commands were executed successfully. Now you should have the AWS EC2 instance launched in AWS Cloud.

Verifying the AWS instance
Verifying the AWS instance
Generally takes a minute or so to launch an instance, and yes, you can see that the instance is successfully launched now in the us-east-2 region as expected.
