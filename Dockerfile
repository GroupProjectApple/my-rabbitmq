# Use RabbitMQ base image
FROM rabbitmq:3-management

# Expose ports
EXPOSE 5672 15672

# Start both NGINX and RabbitMQ
CMD rabbitmq-server
