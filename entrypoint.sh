#!/bin/bash

chmod +x /app/wait-for-it.sh

/bin/bash /app/wait-for-it.sh db:5432 -t 300 -- bash startup.sh