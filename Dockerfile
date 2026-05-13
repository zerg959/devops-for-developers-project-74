FROM node:20.12.2
RUN apt-get update && apt-get install -y make
WORKDIR /app