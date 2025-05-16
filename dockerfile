FROM nginx:alpine

# Copy custom configuration file if needed
# COPY nginx.conf /etc/nginx/nginx.conf

COPY Blog/html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

