# Use a Debian-based image to ensure compatibility with RabbitMQ and NGINX
FROM debian:bullseye-slim

# Install RabbitMQ and NGINX
RUN apt-get update && \
    apt-get install -y rabbitmq-server nginx && \
    apt-get clean

# Configure RabbitMQ to run as a service
RUN rabbitmq-plugins enable rabbitmq_management

# Create an NGINX configuration to block HTTP traffic on port 5672
RUN echo "
server {
    listen 5672;
    return 403;  # Block all non-AMQP traffic
}
server {
    listen 15672;
    location / {
        proxy_pass http://127.0.0.1:15672;
    }
}" > /etc/nginx/sites-available/default && \
    ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/

# Expose RabbitMQ ports
EXPOSE 5672 15672

# Define the entrypoint to start both RabbitMQ and NGINX
CMD service nginx start && rabbitmq-server
