# DDOS-protection system
Bài tập lớn này nhằm mục đích phát triển một hệ thống chống lại các cuộc tấn công từ chối dịch vụ phân tán (DDoS), có thể làm quá tải các máy chủ web và gây gián đoạn dịch vụ. Hệ thống sử dụng kết hợp phân tích lưu lượng truy cập, giới hạn tỷ lệ và lọc tự động để phát hiện và chặn lưu lượng truy cập độc hại trong thời gian thực. Mục tiêu của dự án này là tạo ra một cơ chế phòng thủ hiệu quả và đáng tin cậy giúp giảm thiểu thời gian ngừng hoạt động và bảo vệ các dịch vụ web khỏi các mối đe dọa DDoS.

**Các công cụ sử dụng:**
  *1. HAProxy
  2. Fail2ban
  3. Nginx
  4. Prometheus
  5. Grafana
  6. Firewall*

**Video demo:** [Demo](https://www.youtube.com/watch?v=yiXE8spNnRk) 

**Bước cài đặt:**
*Thực hiện lần lượt các file .sh * 
*Cài đặt Prometheus, Grafana theo các trang docs:*
- [Prometheus for HAProxy](https://www.haproxy.com/documentation/haproxy-configuration-tutorials/alerts-and-monitoring/prometheus/)
- [Prometheus for Nginx](https://github.com/nginxinc/nginx-prometheus-exporter)

- [Grafana](https://prometheus.io/docs/visualization/grafana/)


