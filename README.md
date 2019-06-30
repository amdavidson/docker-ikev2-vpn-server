# IKEv2 VPN Server on Docker

Recipe to build [`amdavidson/vpn-server`](https://registry.hub.docker.com/u/amdavidson/vpn-server/) Docker image.

## Usage

### 1. Start the IKEv2 VPN Server

    docker run -d \
    --name vpn-server \
    --restart=always \
    --cap-add=NET_ADMIN \
    -v vpn-server-etc:/etc \
    -p 500:500/udp -p 4500:4500/udp \
    -e "DNS=9.9.9.9" \
    amdavidson/vpn-server:latest

### 2. Generate the .mobileconfig (for iOS / macOS)

    docker run -it --rm \
    --volumes-from vpn-server \
    -e "HOST=vpn1.example.com" \
    -e "SAFE_SSID=my home ssid" \
    amdavidson/vpn-server:latest \
    generate-mobileconfig > ikev2-vpn.mobileconfig

Be sure to replace `vpn1.example.com` with your own domain name and resolve it to you server's IP address. 

Transfer the generated `ikev2-vpn.mobileconfig` file to your local computer via SSH tunnel (`scp`) or any other secure methods.

## License
Copyright (c) 2019 Andrew Davidson

Copyright (c) 2016 Mengdi Gao

This software is licensed under the [MIT License](LICENSE).
