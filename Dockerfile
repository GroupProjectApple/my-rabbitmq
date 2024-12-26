# Use the official RabbitMQ image
FROM rabbitmq:3-management

# Set default RabbitMQ credentials
ENV RABBITMQ_DEFAULT_USER=admin
ENV RABBITMQ_DEFAULT_PASS=admin123

# Copy the custom configuration file
COPY rabbitmq.conf /etc/rabbitmq/rabbitmq.conf

# Expose the required ports
EXPOSE 5672
EXPOSE 15672

# Start RabbitMQ server
CMD ["rabbitmq-server"]
