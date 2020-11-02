# jenkins-init.sh  jenkins-run-terraform.sh

## jenkins-init.sh file
- first lines waits for our EBS device because there's an EBS device attached to this instance </br>
- once it's there, we're going to create volumes </br>
- then we're going to create a partition </br>
- then we can create our file system using ext4 </br>
- Once the file system is created, we can create the directory var/lib/jenkins </br>
- then mount this volume in var/lib/jenkins </br>
- Once this is done we can install Jenkins </br>
- first add Jenkins to our package manager </br>
- run apt-get update </br>
- install the dependencies, openjdk-11 awscli </br>
- install Jenkins and unzip </br>
- Terraform and packer </br>

IMPORTANT TO NOTE THAT we get the releases from the jenkins website!!! </br>

AND DON'T FORGET to clean up at the end!!! </br>


## jenkins-run-terraform.sh

- First going to cd in the jenkins-packer-demo
- get our s3 bucket, and then we have to change it to TF file
- retrieve from s3's AMIvar
- then 'terraform init' to initialize terraform
- then 'terraform apply'
- 'terraform apply' will add the app instance resource with an instance count of one using the AMI ID that Packer has built.