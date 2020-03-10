#!/usr/bin/env bash

update_packages() {
    echo "Updating packages"
    sudo apt update
    sudo apt upgrade
}

install_mssql() {
    echo "Installing MSSQL 2019"
    wget -qO- https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
    sudo add-apt-repository "$(wget -qO- https://packages.microsoft.com/config/ubuntu/16.04/mssql-server-2017.list)"
    sudo apt-get update
    sudo apt-get install -y mssql-server
}

clean_up() {
    echo "Cleaning"
    sudo apt -y autoremove && sudo apt autoclean > /dev/null 2>&1
}

setup() {
    update_packages
    install_mssql
    clean_up
}

setup "$@"
