# Use the official Node.js 18 image.
# https://hub.docker.com/_/node
FROM node:18-slim

# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
# A wildcard is used to ensure both package.json AND package-lock.json are copied.
# Copying this separately prevents re-running npm install on every code change.
COPY package*.json ./

# Install production dependencies.
# `npm ci` is used for a clean install from the lock file.
RUN npm install

# Copy local code to the container image.
COPY . .

# Expose the port your app runs on
EXPOSE 3000

# Run the web service on container startup.
CMD [ "npm", "start" ]
