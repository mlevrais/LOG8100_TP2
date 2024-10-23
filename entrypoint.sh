#!/bin/bash

chmod +x /app/wait-for-it.sh

echo "Postgres host is ${POSTGRES_HOST}:${POSTGRES_PORT}"

/bin/bash /app/wait-for-it.sh db:${POSTGRES_PORT} -t 300 -h ${POSTGRES_HOST} -- bash startup.sh