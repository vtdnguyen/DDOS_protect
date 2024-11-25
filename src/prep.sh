#!/bin/bash
# Desktop-Specific Preparation

desktop_prep() {
    # Check for sudo
    if [[ $EUID -ne 0 ]]; then
        echo "Use: sudo bash $0"
        exit 1
    fi

    # Update and install packages
    log_message "info" "Updating system and installing comprehensive packages..."
    apt update && apt upgrade -y
    apt install -y \
        nginx \
        haproxy \
        fail2ban \
        ufw \
        git \
        curl \
        
        

    # Create directory structure
    mkdir -p /opt/desktop-ddos-protection/{config,logs,data}
    cd /opt/desktop-ddos-protection
}

desktop_prep
