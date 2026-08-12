# 1. Use an official, lightweight base image
FROM nginx:alpine

# 2. Copy our custom HTML file into the container's default Nginx directory
COPY index.html /usr/share/nginx/html/index.html

# 3. Expose port 80 so we can talk to it
EXPOSE 80

# 4. The command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]