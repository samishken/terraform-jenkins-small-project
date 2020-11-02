# I used terraform-Jenkins-And-Packer for thsi small project

## This project will
First, run "Terraform Apply" to spin up Jenkins Instance </br>

Second, run Jenkins job to execute Packer and build a new AMI. </br>

Thridly, run Terraform within Jenkins to spin up an instance using the newly created AMI </br>

## "Terraform Apply"
- will create 23 new resources.
- the Jenkins machine,
- EBS volume,
- app instance,
- attache attach the EBS volume with app instance
- it will then run the user data to wait for this volume,
- then create a file system, install Jenkins on it.

> Once "terraform apply" is completed:
>> - run "ps aux | grep jenkins" to see if jenkins completely installed.


### key file </br>
Inside 'instance.tf' there is a data souce which will gives us the ubuntu-bionic-18.04 image. We will this AMI as our AWS instance resource.

> Additionaly 'instance.tf' will </br>
>> - use the specified AMI and AMI's id </br>
>> - launch public subnet, which will be created in the VPC.tf file. </br>
>> - use a security group which will allow us to go to Jenkins. </br>
>> - use key_name. We must create new open SSH keys before we do "Terraform apply". </br>
>> - use user data to execute commands when Jenkins instance comes up. </br>

# Jenkins packer demo build
```
ARTIFACT=`packer build -machine-readable packer-demo.json |awk -F, '$0 ~/artifact,0,id/ {print $6}'`
AMI_ID=`echo $ARTIFACT | cut -d ':' -f2`
echo 'variable "APP_INSTANCE_AMI" { default = "'${AMI_ID}'" }' > amivar.tf
aws s3 cp amivar.tf s3://terraform-state-a2b62lf/amivar.tf
```

# Jenkins terraform build
```
cd jenkins-packer-demo
aws s3 cp s3://terraform-state-a2b62lf/amivar amivar.tf
touch terraformskey
touch terraformskey.pub
terraform apply -auto-approve -var APP_INSTANCE_COUNT=1 -target aws_instance.app-instance
```
