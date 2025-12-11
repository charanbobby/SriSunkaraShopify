FROM node:18-alpine

# Install system dependencies required for Shopify CLI extensions
RUN apk add --no-cache git ruby ruby-dev build-base xdg-utils

# Install Shopify CLI globally
RUN npm install -g @shopify/cli @shopify/theme

# Install Go 1.24.0 (required for GitHub MCP server - needs >= 1.24.0)
# Alpine's Go package is too old (1.23.9), so we install from official source
RUN apk add --no-cache wget && \
    ARCH=$(uname -m) && \
    if [ "$ARCH" = "x86_64" ]; then GOARCH="amd64"; \
    elif [ "$ARCH" = "aarch64" ]; then GOARCH="arm64"; \
    else echo "Unsupported architecture: $ARCH" && exit 1; fi && \
    wget https://go.dev/dl/go1.24.0.linux-${GOARCH}.tar.gz && \
    tar -C /usr/local -xzf go1.24.0.linux-${GOARCH}.tar.gz && \
    rm go1.24.0.linux-${GOARCH}.tar.gz && \
    apk del wget

# Add Go to PATH
ENV PATH="/usr/local/go/bin:${PATH}"

# Build GitHub MCP server from source
RUN git clone https://github.com/github/github-mcp-server.git /tmp/github-mcp-server && \
    cd /tmp/github-mcp-server && \
    go build -o /usr/local/bin/github-mcp-server ./cmd/github-mcp-server && \
    cd / && \
    rm -rf /tmp/github-mcp-server

# Set working directory
WORKDIR /app

# Expose port for Shopify CLI server (default 9292)
EXPOSE 9292

# Prevent Shopify CLI from trying to open browser
ENV CODESPACES=1

# Default command
CMD ["sh"]
