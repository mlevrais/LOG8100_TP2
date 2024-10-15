#!/bin/bash

chmod +x /app/wait-for-it.sh

echo "Postgres host is ${POSTGRES_HOST}"

/bin/bash /app/wait-for-it.sh db:5432 -t 300 -h ep-lively-shape-a4xbenvr-pooler.us-east-1.aws.neon.tech -- bash startup.sh