FROM node:carbon
LABEL MAINTAINER "Subash SN"

# Set environment variables for non-interactive install
ENV DEBIAN_FRONTEND=noninteractive

# Remove references to stretch-updates and security.debian.org
RUN sed -i 's/deb.debian.org/archive.debian.org/g' /etc/apt/sources.list \
    && sed -i '/stretch-updates/d' /etc/apt/sources.list \
    && sed -i '/security.debian.org/s/^/#/' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends apt-utils \
    && apt-get upgrade -y libc6 \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package*.json ./

RUN npm install && npm list

COPY . .

EXPOSE 9090

CMD ["npm", "start"]