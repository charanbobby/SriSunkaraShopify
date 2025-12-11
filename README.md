# Shopify Development Environment

This project contains the Shopify theme configuration for two stores: **Sri Sunkara Shop** and **Silk & Snow**. We use Docker to ensure a consistent development environment.

## 🛍️ Stores Overview

### 1. Sri Sunkara Shop (Main)
*   **Store URL:** [https://sri-sunkara-shop-dev.myshopify.com/](https://sri-sunkara-shop-dev.myshopify.com/)
*   **Password:** `luiggu`
*   **Local URL:** [http://localhost:9292](http://localhost:9292)

### 2. Silk & Snow (Tailwind CSS)
*   **Store URL:** [https://development-silkandsnow.myshopify.com/](https://development-silkandsnow.myshopify.com/)
*   **Password:** `thatse`
*   **Local URL:** [http://localhost:9292](http://localhost:9292)

---

## 🚀 Quick Start

### 1. Start Docker
First, ensure your Docker container is running:

```powershell
docker compose up -d
```

### 2. Choose Your Workflow

#### Option A: Develop on Silk & Snow (with Tailwind CSS)
This command runs both the Shopify Theme Dev server and the Tailwind CSS watcher simultaneously.

**From your terminal (Host):**
```powershell
docker compose exec -it shopify-cli sh -c "cd silkandsnow && npm run dev"
```

**OR manually inside the container:**
```powershell
docker compose exec -it shopify-cli sh
# Inside container:
cd silkandsnow
npm run dev
```

#### Option B: Develop on Sri Sunkara Shop
This uses the standard Shopify CLI.

**From your terminal (Host):**
```powershell
docker compose exec -it shopify-cli shopify theme dev --store=sri-sunkara-shop-dev.myshopify.com --host 0.0.0.0
```

**OR manually inside the container:**
```powershell
docker compose exec -it shopify-cli sh
# Inside container:
shopify theme dev --store=sri-sunkara-shop-dev.myshopify.com --host 0.0.0.0
```

---

## 🛠️ Setup & Installation

If this is your first time:

1.  **Clone the repository:**
    ```bash
    git clone https://github.com/charanbobby/SriSunkaraShopify.git
    cd SriSunkaraShopify
    ```

2.  **Start Docker:**
    ```powershell
    docker compose up -d
    ```

3.  **Authenticate (First Time Only):**
    You need to log in to the store you are working on.
    ```powershell
    docker compose exec -it shopify-cli shopify auth login --store=sri-sunkara-shop-dev.myshopify.com
    # or for Silk & Snow
    docker compose exec -it shopify-cli shopify auth login --store=development-silkandsnow.myshopify.com
    ```

---

## 🧩 Silk & Snow Details

The Silk & Snow theme is located in the `silkandsnow/` directory and uses **Tailwind CSS v4**.

*   **Build CSS manually:** `npm run build:css` (inside `silkandsnow/`)
*   **Watch CSS only:** `npm run watch:css`
*   **Dev Server (All-in-one):** `npm run dev` (Runs Shopify dev + Tailwind watch)

> **Note:** Source files are in `silkandsnow/src/`. Compiled CSS goes to `silkandsnow/assets/tailwind.css`.

---

## 🤖 AI & Tools

The container includes the **GitHub MCP Server** for AI interactions.
*   Check status: `docker compose exec shopify-cli github-mcp-server --version`
*   Configure token in `.env` (variable: `GITHUB_PERSONAL_ACCESS_TOKEN`)
