# Use an official Node.js runtime as the base image
FROM node:14-alpine

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
COPY package*.json ./

# Install dependencies (production only)
RUN npm install --only=production

# Copy the rest of the application code to the container
COPY . .

# Build the React app
RUN npm run build

# Install 'serve' to serve the static build
RUN npm install -g serve

# Set the command to run the production build of the React app
CMD ["serve", "-s", "build"]

# Expose the port the app will run on
EXPOSE 3000
