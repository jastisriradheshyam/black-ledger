#!/bin/bash

fabric_base_version=2.1.0
fabric_ca_version=1.4.7
ca_bin_version=1.4.4
os_arch=$(echo "$(uname -s | tr '[:upper:]' '[:lower:]' | sed 's/mingw64_nt.*/windows/')-$(uname -m | sed 's/x86_64/amd64/g')" | awk '{print tolower($0)}')

# retrive the docker images
get_docker_images() {
    # Fabric peer
    docker pull "hyperledger/fabric-peer:$fabric_base_version"
    # Fabric Orderer
    docker pull "hyperledger/fabric-orderer:$fabric_base_version"
    # Fabric CA
    docker pull "hyperledger/fabric-ca:$fabric_ca_version"
}

get_binaries() {
    local archive_file_name="hyperledger-fabric-linux-amd64-$fabric_base_version.tar.gz"
    # Download
    curl -OL https://github.com/hyperledger/fabric/releases/download/v$fabric_base_version/$archive_file_name

    # extract
    tar -xvf $archive_file_name

    local ca_archive_file_name="hyperledger-fabric-ca-${os_arch}-${ca_bin_version}.tar.gz"
    curl -OL "https://github.com/hyperledger/fabric-ca/releases/download/v${ca_bin_version}/${ca_archive_file_name}"

    tar -xvf $ca_archive_file_name
}
get_docker_images
get_binaries
