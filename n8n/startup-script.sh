#!/bin/sh
set -e

echo "Waiting for MySQL to be ready ..."
# Use wait-for-it to wait for MySQL to be ready
/wait-for-it.sh "$DB_MYSQLDB_HOST:3306" --timeout=30 --strict -- echo "MySQL is up"

echo "Creating the database n8n ..."
# Create the database
mysql -u"root" -p"root" -h"$DB_MYSQLDB_HOST" -e "CREATE DATABASE IF NOT EXISTS \`$DB_MYSQLDB_DATABASE\`; GRANT ALL PRIVILEGES ON n8n.* TO 'db'@'%'; FLUSH PRIVILEGES;"

echo "Starting n8n..."
# Start n8n
exec n8n
