# Quick Start Guide - eSports Team Management System

## 🚀 Getting Started

### Prerequisites
- Java 17 or higher
- Maven 3.6+
- MySQL 8.0+ (or XAMPP)
- Docker & Docker Compose (optional, for containerized deployment)

### Quick Deploy Options

#### Option 1: Docker Deployment (Easiest - No Installation Required)

```bash
# Start everything with one command
docker-compose up --build

# Application will be available at:
# http://localhost:8080/eSportsTeamManagementSystem

# Stop
docker-compose down
```

#### Option 2: Local Tomcat Deployment

**Windows:**
```bash
# Run the deployment script
deploy-windows.bat
```

**Linux/Mac:**
```bash
chmod +x deploy-unix.sh
./deploy-unix.sh
```

#### Option 3: Maven Embedded Tomcat (Simplest)

```bash
# No Tomcat installation needed
mvn clean tomcat:run

# Open browser: http://localhost:8080/eSportsTeamManagementSystem
```

---

## 🔑 Default Login Credentials

```
Username: AYUSH1234
Password: Ayush@2908
```

---

## 📋 Manual Setup Steps

### Step 1: Set Up Database

**Using MySQL CLI:**
```bash
mysql -u root -p < src/main/resources/database.sql
```

**Using XAMPP phpMyAdmin:**
1. Start XAMPP MySQL
2. Open http://localhost/phpmyadmin
3. Import `src/main/resources/database.sql`

### Step 2: Configure Connection (if needed)

Edit `src/main/resources/app.properties`:
```properties
db.url=jdbc:mysql://localhost:3306/esports_db?useSSL=false&serverTimezone=UTC
db.user=root
db.pass=
```

### Step 3: Build Project

```bash
mvn clean package
```

### Step 4: Deploy & Run

**Option A: Tomcat**
```bash
copy target\eSportsTeamManagementSystem.war C:\tomcat\webapps\
C:\tomcat\bin\catalina.bat start
```

**Option B: Maven**
```bash
mvn clean tomcat:run
```

**Option C: Docker**
```bash
docker-compose up
```

### Step 5: Access Application

Open browser: `http://localhost:8080/eSportsTeamManagementSystem`

---

## 🌐 Make Accessible to Everyone

### Using ngrok (Free Tunnel)

```bash
# Install: https://ngrok.com/download
ngrok http 8080

# Share public URL:
# https://xxxx-xx-xxx-xxx.ngrok.io/eSportsTeamManagementSystem
```

### Deploy to Cloud

- **Azure App Service**: See DEPLOYMENT.md
- **AWS Elastic Beanstalk**: See DEPLOYMENT.md
- **Google Cloud**: See DEPLOYMENT.md
- **DigitalOcean**: See DEPLOYMENT.md

---

## 🔍 Verify Deployment

```bash
# Check if running
curl http://localhost:8080/eSportsTeamManagementSystem

# View logs
# Windows: type C:\tomcat\logs\catalina.out
# Linux:   tail -f /opt/tomcat/logs/catalina.out
```

---

## 📚 Documentation

- `README.md` - Full project documentation
- `DEPLOYMENT.md` - Detailed deployment guide
- `.github/workflows/` - GitHub Actions CI/CD

---

## ❓ Need Help?

See **DEPLOYMENT.md** for:
- Detailed troubleshooting
- Production configuration
- Cloud deployment options
- Security checklist

---

**Version**: 1.0.0 | **Updated**: November 2025
