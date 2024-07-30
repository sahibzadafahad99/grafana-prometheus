# Grafana and Prometheus Installation Script

This repository contains a shell script to install Grafana and Prometheus on Amazon Linux 2023.

## Prerequisites

Ensure you have superuser privileges to install and configure services on your system.

## Installation

To install Grafana and Prometheus, follow these steps:

1. Clone the repository:

    ```sh
    git clone https://github.com/sahibzadafahad99/grafana-prometheus.git
    cd ubuntu22.04
    ```

2. Make the installation script executable:

    ```sh
    chmod +x grafana-prometheus.sh
    ```

3. Run the installation script with superuser privileges:

    ```sh
    sudo ./grafana-prometheus.sh
    ```

## Services

- **Prometheus** will be running on port `9090`.
- **Grafana** will be running on port `3000`. You can access Grafana at `http://localhost:3000`.

## Default Grafana Credentials

By default, Grafana sets up the following credentials:

- **Username:** `admin`
- **Password:** `admin`

## Prometheus Configuration

The Prometheus configuration file is located at `/etc/prometheus/prometheus.yml`. You can modify this file to add your scrape configurations and alerting rules.

## Grafana Configuration

Grafana is installed with default settings. After installation, you can access the Grafana web interface at `http://localhost:3000` and configure your data sources and dashboards.

## Contributing

Feel free to open issues or submit pull requests if you have any improvements or bug fixes.

