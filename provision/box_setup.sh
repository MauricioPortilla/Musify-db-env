#!/usr/bin/env bash

update_packages() {
    echo "Updating packages"
    sudo apt-get update -y
    # sudo apt-get upgrade -y
}

install_postgresql() {
    echo "Installing Postgresql"
    sudo apt-get install -y postgresql postgresql-contrib
}

clean_up() {
    echo "Cleaning"
    sudo apt -y autoremove && sudo apt autoclean > /dev/null 2>&1
}

setup() {
    update_packages
    install_postgresql
    clean_up
}

setup "$@"
