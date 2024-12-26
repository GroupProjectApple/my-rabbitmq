#!/bin/bash

# Start RabbitMQ in the background
rabbitmq-server &

# Start NGINX
nginx -g "daemon off;"
