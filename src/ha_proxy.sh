configure_haproxy() {
  
    cat << 'EOF' | tee /etc/haproxy/haproxy.cfg
global
    log /dev/log local0
    chroot /var/lib/haproxy
    user haproxy
    group haproxy
    daemon
    maxconn 5000

defaults
    log     global
    mode    http
    option  httplog
    timeout connect 5s
    timeout client  30s
    timeout server  30s

frontend http_front
    bind *:80
    # Basic DDoS protection rules
    
    stick-table type ip size 50k expire 30m store conn_cur,conn_rate(10s),http_req_rate(10s)
    tcp-request connection track-sc0 src
    tcp-request connection reject if { src_conn_cur gt 50 }
    tcp-request content reject if { sc0_conn_rate gt 20 }
    http-request deny if { sc0_http_req_rate gt 100 }
     # Replace with secure username and password
        # URI for the stats page
 
    default_backend haproxy

frontend prometheus
  bind :8405
  mode http
  http-request use-service prometheus-exporter
  no log

backend haproxy
    stats enable
    stats uri /haproxy_stats
    stats auth admin:password  
    option httpchk GET /
    balance roundrobin
    server to_nginx_server 127.0.0.1:8080 check
EOF
}

configure_haproxy
