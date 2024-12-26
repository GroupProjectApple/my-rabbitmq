# Use RabbitMQ base image
FROM rabbitmq:3-management

# Add NGINX to block non-AMQP traffic
RUN apt-get update && apt-get install -y nginx

# Create NGINX config to allow only HTTP traffic to 15672
RUN echo "
server {
    listen 80;
    location / {
        proxy_pass http://127.0.0.1:15672;
    }
}

server {
    listen 5672;
    return 403;  # Deny all non-AMQP traffic to 5672
}" > /etc/nginx/sites-available/default

# Expose ports
EXPOSE 5672 15672

# Start NGINX and RabbitMQ
CMD service nginx start && rabbitmq-server
