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

### Quick Start (Recommended)

The fastest way to start developing with Tailwind CSS and Shopify:

1.  **Shell into the container:**

    ```powershell
    docker-compose exec -it shopify-cli sh
    ```

2.  **Navigate to silkandsnow and start development:**

    ```bash
    cd silkandsnow
    npm run dev
    ```

    This single command runs **both**:

    - 🛍️ Shopify theme dev server (http://localhost:9292)
    - 🎨 Tailwind CSS watch mode (auto-rebuild on save)

3.  **Authenticate (first time only):**
    - Copy the authentication URL from the terminal
    - Open it in your browser and log in
    - The dev server will start automatically

**Access your local site at:** [http://localhost:9292](http://localhost:9292)

---

### Alternative: Manual Setup

If you prefer to run commands separately:

1.  **Pull the Theme (Optional):**

    ```bash
    shopify theme pull --store=development-silkandsnow.myshopify.com --path silkandsnow
    ```

2.  **Run the Dev Server (without Tailwind):**
    ```bash
    shopify theme dev --store=development-silkandsnow.myshopify.com --path silkandsnow --host 0.0.0.0
    ```

### 2. Tailwind CSS Setup (Silk and Snow)

The Silk and Snow theme uses Tailwind CSS v4 for styling. The installation is complete and ready to use.

**Setup includes:**

- ✅ **Package.json**: Tailwind CSS v4.1.17 installed
- ✅ **Input CSS**: `src/input.css` with Tailwind import
- ✅ **Build Scripts**: Configured in package.json
- ✅ **Output CSS**: Compiled to `assets/tailwind.css`
- ✅ **Theme Integration**: Added to `snippets/stylesheets.liquid`
- ✅ **.shopifyignore**: Excludes `node_modules/` and `src/` from uploads

**Build Commands:**

```bash
# Inside the Docker container
cd silkandsnow

# Build CSS once (minified for production)
npm run build:css

# Watch for changes and rebuild automatically
npm run watch:css
```

**Usage in Liquid files:**

You can now use Tailwind utility classes in any Liquid template:

```liquid
<div class="bg-blue-500 text-white p-4 rounded-lg">
  <h1 class="text-3xl font-bold">Hello Tailwind!</h1>
</div>
```

**Development Workflow:**

**Option 1: Run everything with one command (Recommended)**

```bash
# Inside the Docker container
cd silkandsnow
npm run dev
```

This single command runs both:

- Shopify theme dev server (with hot reload)
- Tailwind CSS watch mode (auto-rebuild on changes)

**Option 2: Run separately in two terminals**

1. Run `npm run watch:css` in one terminal (inside Docker)
2. Run `shopify theme dev` in another terminal
3. Edit your Liquid files with Tailwind classes
4. Tailwind automatically rebuilds when you save

> **Note:** Only the compiled `assets/tailwind.css` is uploaded to Shopify. Source files in `src/` and `node_modules/` are excluded via `.shopifyignore`.

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

### Tailwind CSS not rebuilding?

If your Tailwind classes aren't being compiled:

1. Check that `npm run dev` or `npm run watch:css` is running
2. Verify the file `assets/tailwind.css` exists
3. Check the terminal for Tailwind build errors
4. Make sure your changes are in files that Tailwind scans (`.liquid` files)

### Concurrent mode (`npm run dev`) not working?

If both services don't start:

- **Fix:** Stop any existing Shopify dev servers first (`Ctrl + C`)
- **Fix:** Make sure you're in the `silkandsnow` directory before running `npm run dev`
- **Fix:** Check that `concurrently` is installed: `npm install`

### Tailwind classes not showing in browser?

1. Check that `assets/tailwind.css` is linked in `snippets/stylesheets.liquid`
2. Clear your browser cache (`Ctrl + Shift + R`)
3. Rebuild Tailwind: `npm run build:css`

---

## 📊 Monitoring Resources

To check if Docker is using too much memory:

```powershell
docker stats
```

Look for `shopify-shopify-cli-1`.
