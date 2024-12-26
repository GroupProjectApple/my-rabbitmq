# Use the RabbitMQ image with the management plugin
FROM rabbitmq:management

# Expose RabbitMQ ports
# Port 5672: For RabbitMQ communication
# Port 15672: For the RabbitMQ management UI
EXPOSE 5672 15672

# Optional: Add environment variables for configuration (like username/password)
ENV RABBITMQ_DEFAULT_USER=admin
ENV RABBITMQ_DEFAULT_PASS=admin123
