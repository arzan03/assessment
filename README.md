# Assessment Project Setup

## Setup Instructions
1. Ensure you have an Ubuntu-based host (or similar) with internet access.
2. Clone or download this repository's contents to your local machine.
3. If provisioning via Ansible:
   - Update `ansible/inventory` with your server IP and SSH credentials.
   - Run `ansible-playbook -i ansible/inventory ansible/playbook.yml`.
4. If using Docker only, build and run directly:
   - `docker build -t yii2-app .`
   - `docker run -p 8080:8080 yii2-app`.

## Assumptions
- Target environment is a fresh Ubuntu system with basic networking.
- Docker and Ansible roles handle installation of essential packages.
- You have correct SSH keys or credentials for remote deployment.

## Testing Deployment
- After provisioning, navigate to the server’s domain or IP on port 80 (reverse-proxy) or 8080 directly to see the Yii2 app running.
- Check logs via Docker or systemd for any errors.
- Manually verify key pages (home, about, contact) to confirm backend functionality.
- You can also verify Prometheus by checking http://<server-ip>:9090 for metrics and alerts.

## Monitoring
Prometheus is running with a node exporter. You can check metrics at:
- http://<server-ip>:9090 for Prometheus
- http://<server-ip>:9100/metrics for node exporter

## Tasks
### 1. Application Deployment
- Containerized a sample Yii2 PHP application using Docker.
- Initialized Docker Swarm and configured the container to run in swarm mode.
- Ran NGINX on the host as a reverse proxy.
- The application used was from [bahrianpro/yii2-app-basic](https://github.com/bahrianpro/yii2-app-basic)

### 2. CI/CD with GitHub Actions
- Triggered the pipeline on push to the main branch.
- Built and pushed the Docker image to a registry.
- SSHed into the EC2 instance and updated the Swarm service.
- Handled rollbacks on failure.

### 3. Infrastructure Automation with Ansible
- Installed Docker, Docker Compose, NGINX, and other dependencies.
- Initialized Docker Swarm and configured NGINX as a reverse proxy.
- Deployed the Swarm service.
- Installed Prometheus and node exporter for monitoring.
