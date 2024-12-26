# Use RabbitMQ base image
FROM rabbitmq:3-management

# Install NGINX
RUN apt-get update && apt-get install -y nginx && apt-get clean

# Add NGINX configuration
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Expose ports
EXPOSE 5672 15672

# Start both NGINX and RabbitMQ
CMD service nginx start && rabbitmq-server
