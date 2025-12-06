# SriSunkaraShopify

This project contains the Shopify theme and Docker configuration for the Sri Sunkara shop.

## Getting Started

We use Docker to run the Shopify CLI, ensuring a consistent environment without local dependency issues.

### Prerequisites

- [Docker Desktop](https://www.docker.com/products/docker-desktop) installed and running.

### Installation & Usage

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/charanbobby/SriSunkaraShopify.git
    cd SriSunkaraShopify
    ```

2.  **Start the environment:**
    ```powershell
    docker-compose up -d
    ```

3.  **Run Shopify Commands:**
    You can run commands inside the container using `docker-compose exec`:
    
    *Check version:*
    ```powershell
    docker-compose exec -T shopify-cli shopify version
    ```

    *Interactive Shell (Recommended):*
    ```powershell
    docker-compose exec -it shopify-cli sh
    ```
    Once inside, you can run `shopify theme login`, `shopify theme dev`, etc.

### Documentation

See [walkthrough.md](walkthrough.md) for detailed step-by-step instructions.

### Test Store Password

`luiggu`
