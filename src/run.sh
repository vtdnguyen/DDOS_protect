GREEN='\033[0;32m'
BLUE='\033[0;34m'
RED='\033[0;31m'
NC='\033[0m'


run() {
systemctl restart haproxy
    systemctl restart nginx
    systemctl restart fail2ban
    
    # Display access points
    echo -e "${BLUE}Access Points:${NC}"
    echo "1. Protected Application: http://localhost:80"
  
}

run
