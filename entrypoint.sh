#!/bin/bash

chmod +x /app/wait-for-it.sh

echo ${POSTGRES_HOST}

/bin/bash /app/wait-for-it.sh db:5432 -t 300 -h ${POSTGRES_HOST} -- bash startup.sh