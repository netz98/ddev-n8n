#!/bin/sh
set -e

# Wait for MySQL to be ready
until mysqladmin ping -h"$DB_MYSQLDB_HOST" --silent; do
    sleep 1
done

# Create the database
mysql -u"root" -p"root" -h"$DB_MYSQLDB_HOST" -e "CREATE DATABASE IF NOT EXISTS \`$DB_MYSQLDB_DATABASE\`; GRANT ALL PRIVILEGES ON n8n.* TO 'db'@'%'; FLUSH PRIVILEGES;"

# Start n8n
exec n8n
