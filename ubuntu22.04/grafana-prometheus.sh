#!/bin/bash

# Update and install prerequisites
sudo apt-get update -y
sudo apt-get install -y wget curl apt-transport-https software-properties-common gnupg

# Install Prometheus
PROMETHEUS_VERSION="2.46.0"
wget https://github.com/prometheus/prometheus/releases/download/v$PROMETHEUS_VERSION/prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz
tar -xvf prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz
sudo mv prometheus-$PROMETHEUS_VERSION.linux-amd64/prometheus /usr/local/bin/
sudo mv prometheus-$PROMETHEUS_VERSION.linux-amd64/promtool /usr/local/bin/
sudo mv prometheus-$PROMETHEUS_VERSION.linux-amd64/consoles /etc/prometheus/
sudo mv prometheus-$PROMETHEUS_VERSION.linux-amd64/console_libraries /etc/prometheus/
sudo mv prometheus-$PROMETHEUS_VERSION.linux-amd64/prometheus.yml /etc/prometheus/

# Create Prometheus systemd service
sudo bash -c 'cat > /etc/systemd/system/prometheus.service <<EOF
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=root
ExecStart=/usr/local/bin/prometheus --config.file=/etc/prometheus/prometheus.yml --storage.tsdb.path=/var/lib/prometheus/
Restart=always

[Install]
WantedBy=multi-user.target
EOF'

# Reload systemd and start Prometheus
sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus

# Install Grafana
wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
sudo add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
sudo apt-get update -y
sudo apt-get install -y grafana

# Start and enable Grafana
sudo systemctl start grafana-server
sudo systemctl enable grafana-server

# Cleanup
rm -rf prometheus-$PROMETHEUS_VERSION.linux-amd64.tar.gz prometheus-$PROMETHEUS_VERSION.linux-amd64

echo "Installation completed!"
echo "Prometheus is running on port 9090."
echo "Grafana is running on port 3000. Access it at http://localhost:3000"
