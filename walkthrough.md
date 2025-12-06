# Shopify CLI Docker Walkthrough

## 1. Verification
You have successfully started the Docker container.
![Docker Desktop Files Tab](uploaded_image_1765025300792.png)
*You can see your container running in Docker Desktop as shown above.*

## 2. How it Works
- **Your Files**: The folder `D:\!Python Applications\Shopify` on your Windows machine is "mounted" to `/app` inside the container.
- **What this means**: Any file you create in that Windows folder appears in the container, and anything the container creates (like a new theme) appears in your Windows folder. You can edit code with your favorite Windows editor (VS Code, Notepad, etc.).

## 3. Running Commands
You should run these commands from your **Windows PowerShell** terminal (in the `D:\!Python Applications\Shopify` directory).

### Option A: One-off Commands
Use this syntax to run a single command without entering the container.

**Check Version:**
```powershell
docker-compose exec -T shopify-cli shopify version
```

### Option B: Interactive Mode (Recommended)
This opens a shell *inside* the container, so you don't have to type `docker-compose exec` every time.

1. **Enter the container:**
   ```powershell
   docker-compose exec -it shopify-cli sh
   ```
   *Your prompt will change to something like `/app #`*

2. **Run Shopify commands directly:**
   ```bash
   shopify theme init
   ```

3. **Exit when done:**
   ```bash
   exit
   ```

## 4. Common Tasks using Interactive Mode

### Initialize a New Theme
1. Enter the container: `docker-compose exec -it shopify-cli sh`
2. Run the init command:
   ```bash
   shopify theme init my-new-theme
   ```
3. You will see a new folder `my-new-theme` appear in your Windows `Shopify` folder.

### Serve a Theme (Preview)
1. Navigate to the theme folder:
   ```bash
   cd my-new-theme
   ```
2. Start the server (allowing access from host):
   ```bash
   shopify theme dev --host 0.0.0.0
   ```
   *Note: We needed to expose port 9292 in the Dockerfile for this to work.*

### Login Note
When you run `shopify login`, it will print a URL. You must copy and open this URL in your browser manually, as the container cannot open it for you.


### Create an App
1. Enter the container: `docker-compose exec -it shopify-cli sh`
2. Run init:
   ```bash
   npm init @shopify/app@latest
   ```

## 5. Troubleshooting
- **"Port already in use"**: Make sure you don't have another instance running.
- **File permissions**: If you can't edit files created by Docker, you might need to adjust permissions, but usually, on Windows Docker Desktop, this is handled automatically.
