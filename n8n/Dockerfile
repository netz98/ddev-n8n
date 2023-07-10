# Use the n8nio/n8n image as base
FROM docker.n8n.io/n8nio/n8n:latest

# Install the MySQL client
RUN apk add --no-cache bash mysql-client

# Download wait-for-it
RUN wget https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh -O /wait-for-it.sh && \
    chmod +x /wait-for-it.sh
