# Use the official RabbitMQ image with management plugins
FROM rabbitmq:3-management

# Set default RabbitMQ credentials
ENV RABBITMQ_DEFAULT_USER=admin
ENV RABBITMQ_DEFAULT_PASS=admin123

# Hardcode RabbitMQ configuration using environment variables
ENV RABBITMQ_CONFIG_LISTENERS_TCP_DEFAULT=5672
ENV RABBITMQ_CONFIG_MANAGEMENT_LISTENER_PORT=15672

# Expose the necessary ports
EXPOSE 5672
EXPOSE 15672

CMD ["rabbitmq-server", "--port", "5672", "--management.port", "15672"]
