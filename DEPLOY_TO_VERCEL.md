# How to Deploy to Vercel

1.  **Build the Flutter Web App:**
    Run the following command in your terminal to build the web version of your app:
    ```bash
    flutter build web --release --renderer html
    ```

2.  **Install Vercel CLI (Optional but recommended):**
    If you don't have the Vercel CLI installed, you can install it via npm:
    ```bash
    npm i -g vercel
    ```

3.  **Deploy:**
    Run the deploy command from the root of your project:
    ```bash
    vercel --prod
    ```
    Follow the prompts to link your project.

**Alternative: GitHub Integration**
1. Push your code to a GitHub repository.
2. Go to Vercel (vercel.com) and click "Add New... > Project".
3. Import your GitHub repository.
4. In the "Build & Development Settings", override the "Output Directory" to `build/web`.
5. Click "Deploy".
