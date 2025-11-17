# Deployment Guide - eSports Team Management System

## 🚀 Quick Deployment Guide

### Local Deployment (Development)

#### Option 1: Install Tomcat 10 (Recommended)

1. **Download Tomcat 10**
   - Visit: https://tomcat.apache.org/download-10.cgi
   - Download: `apache-tomcat-10.x.xx.zip`
   - Extract to: `C:\tomcat` (or your preferred location)

2. **Set Up Database**
   ```bash
   # Ensure MySQL is running
   mysql -u root -p < src/main/resources/database.sql
   ```

3. **Update Database Credentials** (if needed)
   - Edit: `src/main/resources/app.properties`
   - Update `db.url`, `db.user`, `db.pass`

4. **Build Project**
   ```bash
   mvn clean package
   ```

5. **Deploy to Tomcat**
   ```bash
   # Copy WAR file
   copy target\eSportsTeamManagementSystem.war C:\tomcat\webapps\
   
   # Start Tomcat
   C:\tomcat\bin\catalina.bat start
   ```

6. **Access Application**
   - Open: `http://localhost:8080/eSportsTeamManagementSystem`
   - Login: `AYUSH1234` / `Ayush@2908`

#### Option 2: Use Embedded Tomcat with Maven Plugin

```bash
# Build and run with embedded server
mvn clean tomcat:run
```

#### Option 3: Docker Container (If Docker Installed)

```bash
# Build Docker image
docker build -t esports-team-system:latest .

# Run container
docker run -p 8080:8080 -e DB_HOST=host.docker.internal esports-team-system:latest
```

### Stop Tomcat

```bash
# Windows
C:\tomcat\bin\catalina.bat stop

# Linux/Mac
./tomcat/bin/catalina.sh stop
```

---

## 📦 GitHub Deployment Setup

### Push to GitHub

1. **Add Remote Repository**
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/eSportsTeamManagementSystem.git
   git branch -M main
   ```

2. **Commit and Push**
   ```bash
   git add .
   git commit -m "Initial commit: eSports Team Management System"
   git push -u origin main
   ```

### GitHub Actions CI/CD (Optional)

Create `.github/workflows/build.yml`:

```yaml
name: Build and Test

on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]

jobs:
  build:
    runs-on: ubuntu-latest
    
    steps:
    - uses: actions/checkout@v3
    
    - name: Set up JDK 17
      uses: actions/setup-java@v3
      with:
        java-version: '17'
        distribution: 'temurin'
    
    - name: Build with Maven
      run: mvn clean package
    
    - name: Upload artifact
      uses: actions/upload-artifact@v3
      with:
        name: eSportsTeamManagementSystem.war
        path: target/eSportsTeamManagementSystem.war
```

---

## 🌐 Make Accessible to All

### Option 1: ngrok (Free Tunnel Service)

```bash
# Install ngrok: https://ngrok.com/download
ngrok http 8080

# This generates public URL like:
# https://1234-567-89-101.ngrok.io/eSportsTeamManagementSystem
```

### Option 2: Cloudflare Tunnel

```bash
# Install Cloudflare CLI and create tunnel
cloudflare tunnel run
```

### Option 3: Host on Cloud Server

- **Azure App Service**
- **AWS Elastic Beanstalk**
- **Google Cloud App Engine**
- **DigitalOcean App Platform**

---

## ⚙️ Environment Configuration

### Production Configuration

Update `src/main/resources/app.properties`:

```properties
# Use strong password
db.user=esports_user
db.pass=YOUR_STRONG_PASSWORD

# Enable SSL
db.url=jdbc:mysql://remote-host:3306/esports_db?useSSL=true&serverTimezone=UTC

# Application settings
app.name=eSports Team Management System
app.version=1.0.0
```

### Database Setup for Deployment

```bash
# Create database
mysql -u root -p -e "CREATE DATABASE esports_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# Create user with permissions
mysql -u root -p -e "CREATE USER 'esports_user'@'%' IDENTIFIED BY 'Esports@2025'; GRANT ALL PRIVILEGES ON esports_db.* TO 'esports_user'@'%'; FLUSH PRIVILEGES;"

# Import schema
mysql -u esports_user -p esports_db < src/main/resources/database.sql
```

---

## 🔒 Security Checklist

- [ ] Change default login credentials in database
- [ ] Use HTTPS/SSL certificates
- [ ] Set strong database password
- [ ] Configure firewall rules
- [ ] Enable CORS if needed
- [ ] Set up regular backups
- [ ] Use environment variables for secrets
- [ ] Enable session timeout
- [ ] Implement rate limiting

---

## 📊 Monitoring & Maintenance

### Check Application Status

```bash
# View Tomcat logs
type C:\tomcat\logs\catalina.out

# Check database connection
mysql -u esports_user -p -e "SELECT 1;"
```

### Backup Database

```bash
mysqldump -u esports_user -p esports_db > backup_$(date +%Y%m%d).sql
```

---

## ❓ Troubleshooting

| Issue | Solution |
|-------|----------|
| Port 8080 already in use | Change Tomcat port in `conf/server.xml` |
| Database connection error | Verify MySQL is running and credentials in `app.properties` |
| 404 errors on JSP pages | Ensure WAR deployed correctly, restart Tomcat |
| Login fails | Check admin table in database has default user |
| Slow performance | Check database indexes, optimize queries |

---

## 📝 Build & Deploy Commands Summary

```bash
# Build
mvn clean package

# Run locally
mvn clean tomcat:run

# Deploy to Tomcat
copy target\eSportsTeamManagementSystem.war C:\tomcat\webapps\

# Push to GitHub
git add .
git commit -m "message"
git push origin main
```

---

For detailed information, see **README.md**

