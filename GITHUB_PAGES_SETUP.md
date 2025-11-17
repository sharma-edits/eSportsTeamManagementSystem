# 🚀 GitHub Pages Deployment Guide

## ✅ STEP-BY-STEP DEPLOYMENT

Your project is **ready to push to GitHub Pages**. Follow these steps exactly:

---

## STEP 1: Create GitHub Repository

1. Go to https://github.com/new
2. Fill in:
   - **Repository name**: `eSportsTeamManagementSystem`
   - **Description**: "Professional eSports Team Management System - Java web application with teams, players, tournaments, and admin dashboard"
   - **Visibility**: **Public** (required for GitHub Pages)
   - **Initialize repository**: Leave unchecked (we'll push existing code)
3. Click **Create repository**

---

## STEP 2: Push Code to GitHub

Run these commands in PowerShell (exact order):

```powershell
cd "c:\Users\sharm\OneDrive\Desktop\SEM - 3\AJT\Project\eSportsTeamManagementSystem"

git remote add origin https://github.com/sharma-edits/eSportsTeamManagementSystem.git

git branch -M main

git push -u origin main
```

**If you get authentication error:**
- Use GitHub Personal Access Token (recommended for Windows)
- Or use GitHub CLI: `gh auth login`

---

## STEP 3: Enable GitHub Pages

1. Go to your GitHub repository: https://github.com/sharma-edits/eSportsTeamManagementSystem
2. Click **Settings** → **Pages** (in left sidebar)
3. Under "Build and deployment":
   - **Source**: Select **Deploy from a branch**
   - **Branch**: Select **main** from dropdown
   - **Folder**: Select **/ (root)** from dropdown
4. Click **Save**

GitHub will build and deploy automatically. **Wait 1-2 minutes.**

---

## STEP 4: Verify Deployment

### Check GitHub Actions (Build Status)
1. Go to repository → **Actions** tab
2. You should see "pages build and deployment" workflow
3. Wait for green checkmark ✓

### Access Your Live Site
Once complete, your site will be live at:

```
https://sharma-edits.github.io/eSportsTeamManagementSystem/
```

---

## 📋 What's Deployed

### ✓ Static GitHub Pages
- `index.html` - Landing page with project info
- `docs/` - Full documentation
- README.md files

### ✓ Source Code Available
- Full Java source code (`src/`)
- Maven configuration (`pom.xml`)
- Docker files (`Dockerfile`, `docker-compose.yml`)
- Build artifacts (`target/`)
- CI/CD workflows (`.github/workflows/`)

### ❌ NOT on GitHub Pages
- Live web application (requires Java/Tomcat server)
- Database (requires MySQL server)

---

## 🔗 Live Application Access

This GitHub Pages site is **informational/landing page only**.

To run the **actual Java application**, use:

### Option 1: Local Docker
```bash
docker-compose up --build
# Access at: http://localhost:8080/eSportsTeamManagementSystem
```

### Option 2: Local Tomcat
```bash
deploy-windows.bat    # Windows
./deploy-unix.sh      # Linux/Mac
# Access at: http://localhost:8080/eSportsTeamManagementSystem
```

### Option 3: Cloud Deployment (Recommended for public access)

#### Deploy to Heroku (Free)
```bash
heroku create your-esports-app
git push heroku main
```

#### Deploy to Azure App Service
```bash
az webapp up --name esports-app --runtime "JAVA|17-java17"
```

#### Deploy to Railway
1. Connect GitHub repo
2. Auto-deploys on push

---

## 🚀 Quick Command Summary

```powershell
# 1. Navigate to project
cd "c:\Users\sharm\OneDrive\Desktop\SEM - 3\AJT\Project\eSportsTeamManagementSystem"

# 2. Add GitHub remote
git remote add origin https://github.com/sharma-edits/eSportsTeamManagementSystem.git

# 3. Push to GitHub
git branch -M main
git push -u origin main

# 4. Enable GitHub Pages in Settings → Pages (select main / root)

# 5. Your site goes live at:
# https://sharma-edits.github.io/eSportsTeamManagementSystem/
```

---

## 📊 File Structure for GitHub Pages

```
eSportsTeamManagementSystem/
├── index.html                          ← Landing page (GitHub Pages)
├── docs/
│   └── index.md                        ← Documentation
├── README.md                           ← Project overview
├── src/                                ← Java source code
├── pom.xml                             ← Maven configuration
├── Dockerfile                          ← Docker image
├── docker-compose.yml                  ← Multi-container setup
├── .github/
│   └── workflows/
│       └── maven-build.yml             ← CI/CD pipeline
└── [other files]
```

---

## ✨ GitHub Pages Features

✅ Free static hosting
✅ Auto-rebuild on push
✅ Custom domain support (optional)
✅ HTTPS enabled by default
✅ CDN distributed globally
✅ Works with Jekyll, Hugo, or plain HTML

---

## 🔐 Project Visibility

| Item | Status |
|------|--------|
| GitHub Repository | ✓ Public |
| GitHub Pages Site | ✓ Public |
| Source Code | ✓ Public |
| CI/CD Workflows | ✓ Public |
| WAR Artifacts | ✓ Available in Actions |

---

## 📝 Next Steps

1. **Run the commands above** (STEP 2)
2. **Enable GitHub Pages** (STEP 3)
3. **Wait 1-2 minutes** for build
4. **Visit your live site** (STEP 4)
5. **Share the URL**: https://sharma-edits.github.io/eSportsTeamManagementSystem/

---

## ⚙️ For Live Application Access

Users can:
1. Clone your repository: `git clone https://github.com/sharma-edits/eSportsTeamManagementSystem.git`
2. Run locally with Docker: `docker-compose up --build`
3. Deploy to their own server using provided scripts

---

## ✅ Checklist Before Pushing

- [x] `index.html` exists in root
- [x] `docs/index.md` has documentation
- [x] Git repository initialized
- [x] All files committed
- [x] Ready to push to GitHub

---

## 🎉 Success Indicators

After following all steps, you should see:

✓ GitHub repository created
✓ Code pushed to main branch
✓ GitHub Pages enabled
✓ Build workflow running
✓ Live site at: **https://sharma-edits.github.io/eSportsTeamManagementSystem/**

---

**Ready to deploy? Run the commands in STEP 2 now!**

