configure_fail2ban() {
    cat << 'EOF' | tee /etc/fail2ban/jail.local
[DEFAULT]
bantime = 3600
findtime = 600
maxretry = 5

[sshd]
enabled = true

[nginx-http-auth]
enabled = true

[haproxy-http-auth]
enabled = true
port = http,https
filter = haproxy-http-auth
logpath = /var/log/haproxy.log

[nginx-badbots]
enabled = true
EOF
}

configure_fail2ban
