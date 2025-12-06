# SriSunkaraShopify

This project contains the Shopify theme and Docker configuration for the Sri Sunkara shop.

## Getting Started

We use Docker to run the Shopify CLI, ensuring a consistent environment without local dependency issues.
The current directory is mounted to `/app` inside the container, so any changes you make locally are immediately reflected in the container.

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

    _Check version:_

    ```powershell
    docker-compose exec -T shopify-cli shopify version
    ```

## Workflow (Interactive Mode)

We recommend using the interactive shell for most tasks.

1.  **Enter the container:**

    ```powershell
    docker-compose exec -it shopify-cli sh
    ```

    _Your prompt will change to something like `/app #`_

2.  **Login:**
    Run `shopify theme login`.

    > [!IMPORTANT] > **Manual Login Required**: The container cannot open your browser automatically. It will print a URL to the terminal. Copy and paste this URL into your browser to complete the login.

3.  **Common Tasks:**

    _Pull existing theme:_

    ```bash
    shopify theme pull
    ```

    You will be prompted to select the theme you want to pull from your store (e.g., "Dawn", "Development").

    _Serve (preview) a theme:_

    ```bash
    cd my-themed-folder
    shopify theme dev --host 0.0.0.0
    ```

    > Note: We use `--host 0.0.0.0` to expose the server to your host machine.
    > **Access**: Open `http://localhost:9292` in your browser.

    _Create a new app:_

    ```bash
    npm init @shopify/app@latest
    ```

## Troubleshooting

- **Login hanging or crashing**: We've set `CODESPACES=1` in the Dockerfile to force the CLI to print a URL instead of opening a browser. If `xdg-open` errors persist, double-check that you are copying the URL manually.
- **Port already in use**: Ensure no other `shopify theme dev` process is running (check `docker-compose ps`).
- **File permissions**: On Docker Desktop for Windows, file permissions are usually handled automatically. If you cannot edit files, check your Docker Desktop resource sharing settings.

### Test Store Password

`luiggu`

## Monitoring Resources

To check the resource usage (CPU/Memory) of the Docker container, use one of these methods:

1.  **Terminal (Quickest)**:
    Run the command:

    ```powershell
    docker stats
    ```

2.  **Docker Desktop (Graphical)**:
    Open the Docker Desktop dashboard, go to **Containers**, and click on the **Stats** tab (graph icon) for `shopify-shopify-cli-1`.

3.  **VS Code Docker Extension**:
    Click the **Docker** icon (whale) in the VS Code sidebar. Right-click the running container and select **View Stats**.
    _(Note: The "Dev Containers" view shown in your screenshot may not be configured to show these stats directly)._
