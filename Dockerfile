# Use RabbitMQ base image with Management plugin
FROM rabbitmq:3-management

# Install NGINX
RUN apt-get update && apt-get install -y nginx && apt-get clean

# Copy NGINX configuration to the container
COPY nginx.conf /etc/nginx/sites-enabled/default

# Copy the startup script to the container
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Expose RabbitMQ ports
EXPOSE 5672 15672

# Start RabbitMQ and NGINX
CMD ["/usr/local/bin/start.sh"]
