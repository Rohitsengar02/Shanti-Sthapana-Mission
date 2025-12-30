# Fixing Vercel 404 & Deploying Correctly

The "404 NOT_FOUND" error happens because Vercel is looking for an `index.html` in your project root, but Flutter puts it in `build/web`.

**Method 1: Deploy from your computer (Recommended)**

This method is the easiest. You build the app locally and upload the result.

1.  **Build the app:**
    Run this command in your terminal:
    ```bash
    flutter build web --release
    ```

2.  **Deploy the build folder:**
    Run this specific command to deploy ONLY the `build/web` folder:
    ```bash
    npx vercel deploy build/web --prod
    ```
    *If asked "Set up and deploy '~/.../build/web'?", answer **Y**.*
    *If asked to link to existing project, answer **Y** and select the project.*

---

**Method 2: Automatic Git Deployment (Advanced)**

If you want Vercel to build automatically when you `git push`, you need to configure Vercel settings manually because Vercel doesn't support Flutter out of the box.

1.  Go to your Project Settings on Vercel.
2.  Go to **Build & Development Settings**.
3.  Change **Output Directory** to `build/web`.
4.  (Critical) You verify that Vercel has a way to run `flutter build`. Since Vercel doesn't have Flutter installed by default, **Method 1 is much safer and easier.**
