#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_NAME" <<-EOSQL
	CREATE USER $GUAC_DB_USER WITH PASSWORD '$(cat "$GUAC_PASSWORD_FILE")';
	CREATE DATABASE $GUAC_DB_NAME;
	GRANT ALL PRIVILEGES ON DATABASE $GUAC_DB_USER TO $GUAC_DB_NAME;
EOSQL

psql -v ON_ERROR_STOP=1 -U "$GUAC_DB_USER" --dbname "$GUAC_DB_NAME" -f /docker-entrypoint-initdb.d/init/000-init-db.sql

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$GUAC_DB_NAME" <<-EOSQL
	GRANT ALL PRIVILEGES ON DATABASE $GUAC_DB_USER TO $GUAC_DB_NAME;
EOSQL

exit 0
