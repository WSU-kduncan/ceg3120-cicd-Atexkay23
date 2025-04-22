# Use the official Node image to build the app
FROM node:18 AS builder

# Set working directory
WORKDIR /app

# Copy everything into the container
COPY . .

# Install Angular CLI
RUN npm install -g @angular/cli

# Install app dependencies
RUN npm install

# Build the app
RUN ng build

# Use Nginx to serve the app
FROM nginx:alpine

# Copy build output to Nginx's public folder
COPY --from=builder /app/dist/angular-site /usr/share/nginx/html

# Expose port 80
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]

