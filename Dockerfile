# Damn Vulnerable NodeJS Application
# https://github.com/appsecco/dvna

FROM ubuntu:20.04

# Install dependencies
RUN apt-get update && apt-get install -y \
    curl \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Install nvm (Node Version Manager)
ENV NVM_DIR /root/.nvm
RUN curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# Load nvm and install Node.js 8.x
RUN bash -c "source $NVM_DIR/nvm.sh && nvm install 8 && nvm use 8 && nvm alias default 8"

# Add Node.js and npm to the PATH
ENV PATH="/root/.nvm/versions/node/v8.17.0/bin/:$PATH"

# Verify Node.js and npm versions
RUN node -v && npm -v && ldd --version

# Set working directory
WORKDIR /app

# Set up PATH for nvm and Node.js
ENV PATH /root/.nvm/versions/node/v8.x/bin:$PATH

CMD ["/bin/bash", "/app/entrypoint.sh"]