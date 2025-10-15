#  MERN Stack Development Environment Installer (By Brian Ali)

This script automatically installs all essential tools for **MERN Stack development** on Windows.  
It sets up everything you need — from Git and Node.js to MongoDB Shell and VS Code — with just **one click**.

---

##  What This Script Does

1. **Checks for administrator privileges**  
   Ensures the script runs with proper permissions to avoid installation errors.

2. **Installs Chocolatey** *(if not already installed)*  
   Chocolatey is a Windows package manager used to easily install software via the command line.

3. **Refreshes the PATH environment**  
   So newly installed tools can be used immediately without restarting your PC.

4. **Installs all MERN stack essentials:**
   -  **Git** – Version control  
   -  **Git Bash** – Command-line shell for Git (included in `git.install`)  
   -  **Node.js (LTS)** – JavaScript runtime  
   -  **npm** – Package manager for Node.js (installed automatically with Node.js)  
   -  **MongoDB Shell (mongosh)** – For interacting with MongoDB  
   -  **Visual Studio Code** – Powerful code editor

5. **Verifies all installations**  
   Displays the version of each installed tool to confirm successful setup.

6. **Prints a clean summary**  
   Shows a final message listing all installed tools and reminders for next steps.

---

## 🛠️ How to Use

1. **Download or copy the script**  
   Save it as `setup-mern.bat`.

2. **Run as Administrator**
   - Right-click the file → **Run as Administrator**
   - Follow on-screen prompts

3. **Wait for installation**
   The process can take several minutes depending on your internet speed.

4. **Verify**
   Once complete, open a new terminal and run:
   ```bash
   git --version
   node -v
   npm -v
   mongosh --version
   code --version
   ```
# Licence
MIT (this software is free to use or alter )

Windows version only available, other operating systems coming soon
