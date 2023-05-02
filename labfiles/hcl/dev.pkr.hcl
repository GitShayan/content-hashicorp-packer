build {

    sources = [ "source.docker.ubuntu" ]

    provisioner "file" {
        source = "files/"
        destination = "/tmp/"
    }

    provisioner "shell" {
        script = "scripts/init.sh"
    }

}
