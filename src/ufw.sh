configure_firewall() {
    ufw default deny incoming
    ufw default allow outgoing
    ufw allow from 127.0.0.1
    ufw allow 80/tcp
    ufw allow 3000/tcp
    ufw allow 9090/tcp
    ufw --force enable
}

configure_firewall
