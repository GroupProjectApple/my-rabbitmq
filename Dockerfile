# Use the official RabbitMQ image from Docker Hub
FROM rabbitmq:3-management

# Set default RabbitMQ environment variables for user credentials
ENV RABBITMQ_DEFAULT_USER=admin
ENV RABBITMQ_DEFAULT_PASS=admin123

# Expose RabbitMQ's ports
# 5672: AMQP protocol port (main RabbitMQ communication)
# 15672: Management plugin port (web UI)
EXPOSE 5672
EXPOSE 15672

# Optional: Set up additional configurations if needed
# COPY rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

# Start RabbitMQ server
CMD ["rabbitmq-server"]
