source "docker" "ubuntu" {
    image = "ubuntu:bionic"
    commit = true
    changes = [ "ENTRYPOINT [\"apache2ctl\", \"-D\", \"FOREGROUND\"]" ]
}
