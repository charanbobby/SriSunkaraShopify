FROM node:18-alpine

# Install system dependencies required for Shopify CLI extensions
RUN apk add --no-cache git ruby ruby-dev build-base xdg-utils

# Install Shopify CLI globally
RUN npm install -g @shopify/cli @shopify/theme

# Set working directory
WORKDIR /app

# Expose port for Shopify CLI server (default 9292)
EXPOSE 9292

# Prevent Shopify CLI from trying to open browser
ENV CODESPACES=1

# Default command
CMD ["sh"]
