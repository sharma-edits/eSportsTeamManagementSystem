# Firebase Hosting Setup & Deployment Guide

## Project Type
**Static Site + Java Backend Application**
- Static Frontend: `public/` folder (HTML, CSS, JS)
- Backend: Java/JSP application (deployed separately to Tomcat)

## Files Created
- `public/index.html` - Landing page
- `public/docs/index.html` - Documentation
- `firebase.json` - Firebase Hosting configuration
- `.firebaserc` - Firebase project configuration
- `package.json` - npm scripts for deployment
- `.firebaseignore` - Files to ignore during deployment

## Prerequisites
- Node.js 16+ installed
- Firebase account (https://firebase.google.com)
- Google account

## Step-by-Step Deployment

### Step 1: Install Firebase CLI & Dependencies
Open VS Code terminal and run:
```bash
npm install -g firebase-tools
npm install
```

### Step 2: Create Firebase Project
1. Go to https://console.firebase.google.com
2. Click "Add project"
3. Enter project name: `esports-team-management`
4. Select your country
5. Click "Create project"
6. Wait for project creation to complete

### Step 3: Get Firebase Project ID
1. In Firebase Console, click on Settings ⚙️
2. Go to "Project settings"
3. Copy the "Project ID" (e.g., `esports-team-management`)

### Step 4: Update .firebaserc
Replace `esports-team-management` with your actual Firebase Project ID:
```json
{
  "projects": {
    "default": "YOUR_FIREBASE_PROJECT_ID"
  }
}
```

### Step 5: Login to Firebase
In VS Code terminal:
```bash
firebase login
```
This will open a browser window. Sign in with your Google account.

### Step 6: Initialize Firebase Hosting (Optional - Already Done)
The files are already configured. You can verify with:
```bash
firebase list
```

### Step 7: Deploy to Firebase Hosting
Run in VS Code terminal:
```bash
npm run firebase:deploy
```

Or use:
```bash
firebase deploy --only hosting
```

### Step 8: View Your Live Site
After deployment, Firebase will show your hosting URL:
```
✔ Deploy complete!

Project Console: https://console.firebase.google.com/project/YOUR_PROJECT_ID
Hosting URL: https://YOUR_PROJECT_ID.web.app
```

## Verification Checklist

✅ Firebase project created
✅ Project ID in .firebaserc
✅ Firebase CLI logged in
✅ public/index.html exists
✅ public/docs/index.html exists
✅ firebase.json configured
✅ npm install completed
✅ Deployment successful

## Troubleshooting

### Issue: "Please specify a project ID"
**Solution:** 
1. Update .firebaserc with correct Project ID
2. Or use: `firebase use YOUR_PROJECT_ID`

### Issue: "Hosting already enabled"
**Solution:** Normal - just proceed with deployment

### Issue: "Cannot find module firebase-tools"
**Solution:** Run `npm install` again

### Issue: "Authentication required"
**Solution:** Run `firebase logout` then `firebase login`

### Issue: Blank white page after deployment
**Solution:** 
1. Check firebase.json has correct "public" folder
2. Check SPA rewrites are configured
3. Clear browser cache (Ctrl+Shift+Delete)

## Project Structure After Setup

```
eSportsTeamManagementSystem/
├── public/                          # Firebase Hosting folder
│   ├── index.html                   # Landing page
│   ├── docs/
│   │   └── index.html              # Documentation page
├── src/                             # Java source code
│   ├── main/
│   │   ├── java/                   # Java classes
│   │   ├── webapp/                 # JSP pages
│   │   └── resources/              # Config files
├── target/                          # Compiled WAR (for Tomcat)
├── firebase.json                    # Firebase config
├── .firebaserc                      # Project ID
├── .firebaseignore                  # Ignore patterns
├── package.json                     # npm scripts
├── pom.xml                          # Maven config
└── README.md                        # Documentation
```

## Important Notes

1. **Static Site Only**: Firebase Hosting serves ONLY static files from `public/` folder
2. **Java Backend**: Deploy the WAR file to Apache Tomcat separately
3. **Frontend & Backend Separated**: 
   - Frontend (HTML, CSS, JS) → Firebase Hosting
   - Backend (Java, JSP) → Apache Tomcat
4. **Rewrite Rules**: All routes redirect to index.html for SPA functionality
5. **Cache Control**: HTML cached 1 hour, JS/CSS cached 1 year

## Continuous Deployment (CI/CD)

The GitHub Actions workflow `.github/workflows/firebase-deploy.yml` will:
1. Build the Maven project on every push to `main`
2. Deploy to Firebase Hosting automatically
3. Requires `FIREBASE_TOKEN` secret in GitHub

## Common Commands

```bash
# Install dependencies
npm install

# Deploy to Firebase Hosting
npm run firebase:deploy

# View deployment history
firebase hosting:history

# Serve locally (for testing)
npm run serve

# Clear Firebase cache
firebase hosting:disable

# View logs
firebase hosting:log
```

## Support

- Firebase Docs: https://firebase.google.com/docs/hosting
- GitHub Repo: https://github.com/sharma-edits/eSportsTeamManagementSystem
- Email: admin@esports.com
