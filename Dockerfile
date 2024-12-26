# Use RabbitMQ base image
FROM rabbitmq:3-management

# Install NGINX with stream module
RUN apt-get update && apt-get install -y nginx-extras && apt-get clean

# Copy the configuration files
COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Expose required ports
EXPOSE 5672 15672 8080

# Start RabbitMQ and NGINX
CMD ["/usr/local/bin/start.sh"]
