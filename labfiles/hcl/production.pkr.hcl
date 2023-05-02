build {
# we have to use the name that we defined earlier in "amazon-ubuntu.pkr.hcl" file. we used this: 'source "amazon-ebs" "ubuntu"' 
    sources = [ "source.amazon-ebs.ubuntu" ]

    provisioner "file" {
        source = "files/"
        destination = "/tmp/"
    }

    provisioner "shell" {
        script = "scripts/init.sh"
    }

    provisioner "shell" {
        inline = [
            "sudo systemctl start apache2",
            "sudo systemctl enable apache2"
        ]
    }
}
