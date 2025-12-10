# Sri Sunkara Shop Dev

**Store URL:** [https://sri-sunkara-shop-dev.myshopify.com/](https://sri-sunkara-shop-dev.myshopify.com/)
**Store Password:** `luiggu`

This project contains the Shopify theme and Docker configuration for the Sri Sunkara shop. We use Docker to ensure a consistent development environment for everyone.

**Silk and Snow Store URL:** [https://development-silkandsnow.myshopify.com/](https://development-silkandsnow.myshopify.com/)
**Silk and Snow Password:** `thatse`

---

## ⚡ Quick Start

Three steps to get your server running:

1.  **Start Docker:**

    ```powershell
    docker-compose up -d
    ```

2.  **Enter the Dev Container:**

    ```powershell
    docker-compose exec -it shopify-cli sh
    ```

3.  **Start the Theme Server:**
    ```bash
    shopify theme dev --store=sri-sunkara-shop-dev.myshopify.com --host 0.0.0.0
    ```
    _(If asked to login, copy the URL printed in the terminal to your browser)_

**Access your local site at:** [http://localhost:9292](http://localhost:9292)

---

## 🛠️ Detailed Workflow

### 1. Installation (First Time Only)

1.  Install [Docker Desktop](https://www.docker.com/products/docker-desktop).
2.  Clone this repository:
    ```bash
    git clone https://github.com/charanbobby/SriSunkaraShopify.git
    cd SriSunkaraShopify
    ```
3.  Start the container: `docker-compose up -d`

### 2. Daily Development

We do **all** our work inside the `shopify-cli` container to avoid version conflicts.

1.  **Shell into the container:**

    ```powershell
    docker-compose exec -it shopify-cli sh
    ```

    _Your prompt will change to `/app #`_

2.  **Pull the latest live theme (Optional):**
    If you want to sync your local files with what is currently live:

    ```bash
    shopify theme pull
    ```

3.  **Run the Dev Server:**

    ```bash
    shopify theme dev --store=sri-sunkara-shop-dev.myshopify.com --host 0.0.0.0
    ```

4.  **Stop the Server:**
    Press `Ctrl + C` in the terminal.

5.  **Exit the Container:**
    Type `exit` or press `Ctrl + D`.

---

## ❄️ Silk and Snow Workflow

### 1. Developer Setup

1.  **Shell into the container (same as above):**

    ```powershell
    docker-compose exec -it shopify-cli sh
    ```

2.  **Pull the Theme (Optional):**

    ```bash
    shopify theme pull --store=development-silkandsnow.myshopify.com --path silkandsnow
    ```

3.  **Run the Dev Server:**
    ```bash
    shopify theme dev --store=development-silkandsnow.myshopify.com --path silkandsnow --host 0.0.0.0
    ```
    _(Note the `--path silkandsnow` argument is critical)_

---

## 🔄 Bidirectional Workflow (Code ↔️ Theme Editor)

There is no "offline" version of the Theme Editor. Instead, the CLI connects the **Shopify Admin** to your **Local Code**.

### 1. From Code to Preview (Hot Reloading)

1.  Edit a file in VS Code (e.g., `layout/theme.liquid`).
2.  Save the file (`Ctrl + S`).
3.  The browser preview (`http://localhost:9292`) will automatically reload with your changes.

### 2. From Theme Editor to Code

1.  Look at your terminal output for a "Theme Editor" link (usually `https://admin.shopify.com/.../editor...`).
2.  Open that link. **It controls your local development theme.**
3.  Make a change in the editor (e.g., change a color or text setting).
4.  Click **Save**.
5.  **Watch your VS Code:** The CLI will download the changes to your local `config/settings_data.json` or templates automatically.

**Crucial:** Always ensure your `shopify theme dev` server is running while you edit. If you stop the server, the link between the Editor and your local code is broken.

### 3. Multiple Developers? No Problem.

When you run `shopify theme dev`, Shopify creates a **unique, temporary theme** just for you. Your changes in the editor are isolated to this temporary theme. You won't overwrite teammates who are also working on their own local dev servers.

---

## ❓ Troubleshooting

### My changes in `index.json` aren't showing up?

Changes to JSON configuration files sometimes require a **server restart** to take effect.

1.  Stop the server (`Ctrl + C`).
2.  Run `shopify theme dev ...` again.

### "Service is not valid for authentication" (401 Error)?

Your session has expired (common after restarting containers).

- **Fix:** Run `shopify auth logout`, then log in again:
  ```bash
  shopify theme login --store=sri-sunkara-shop-dev.myshopify.com
  ```

### Login hanging or crashing?

We use `CODESPACES=1` to force the CLI to print a URL instead of trying to open a browser window from inside Docker.

- **Fix:** Manually copy the long URL starting with `https://accounts.shopify.com/...` and paste it into your browser.

### "Port already in use" error?

You might have another instance running.

- **Fix:** Run `docker-compose ps` to see running containers, or just restart Docker.

### Files are all white (no color) in VS Code?

You need the Liquid extension.

- **Fix:** Install the recommended extension **"Shopify Liquid"** (id: `Shopify.theme-check-vscode`).

---

## 📊 Monitoring Resources

To check if Docker is using too much memory:

```powershell
docker stats
```

Look for `shopify-shopify-cli-1`.
