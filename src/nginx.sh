configure_nginx() {
    cat << 'EOF' | tee /etc/nginx/conf.d/default.conf
limit_req_zone $binary_remote_addr zone=one:10m rate=30r/s;

server {
    listen 8080;
    server_name localhost;

    # Rate limiting
    limit_req zone=one burst=20 nodelay;

    location / {
       
        proxy_pass http://127.0.0.1:8000;
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    }

}

server {
    listen 8000;
    server_name localhost;
 
    location / {
        root /var/www/html;
        index index.html;
    }
    location /metrics {
    stub_status on;
    access_log off;
    allow 127.0.0.1;  # Only allow scraping from localhost
    deny all;  # Deny all other access
    }

}


EOF
}

configure_nginx
