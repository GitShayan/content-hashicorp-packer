source "amazon-ebs" "ubuntu" {
    access_key = "<ACCESS_KEY>"
    secret_key = "<SECRET_KEY>"
    subnet_id = "<SUBNET_ID>"
    region = "us-east-1"
    instance_type = "t2.micro"
    ami_name = "bookapp-{{timestamp}}"
    source_ami_filter {
        filters = {
            virtualization-type = "hvm"
            name = "ubuntu/images/*ubuntu-bionic-18.04-amd64-server-*"
            root-device-type = "ebs"
        }
        owners = ["099720109477"]
        most_recent = true
    }
    security_group_filter {
        filters = {
            "tag:Class" = "packer"
        }
    }
    ssh_username = "ubuntu"
}
