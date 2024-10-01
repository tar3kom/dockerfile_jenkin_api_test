FROM node:20.13.0-alpine

# Create app directory and set proper ownership
RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

# Set the working directory
WORKDIR /home/node/app

# Copy package files and install dependencies as root
COPY package*.json ./

RUN npm install

# Switch to non-root user for further operations
USER node

# Copy the rest of the application code, setting ownership to the node user
COPY --chown=node:node . .

# Expose the desired port
EXPOSE 4000

# Define the command to run the app
CMD [ "node", "server.js" ]
