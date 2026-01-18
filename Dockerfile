FROM node:20-alpine

# Environment variables
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=qwerty

# Create app directory
WORKDIR /testapp

# Copy only package files first (for caching)
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the app
COPY . .

# Expose app port (change if needed)
EXPOSE 3000

# Start the app
CMD ["node", "server.js"]
