locals {
    environment = terraform.workspace 
    ami_id = data.aws_ami.joindevops.id
}