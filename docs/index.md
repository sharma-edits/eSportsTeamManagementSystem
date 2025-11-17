# Documentation

## Project Overview

**eSports Team Management System** is a professional web application for managing eSports teams, players, tournaments, and matches.

- **GitHub Repository**: https://github.com/sharma-edits/eSportsTeamManagementSystem
- **Project Source**: Java 17 + Jakarta Servlet + MySQL

## Quick Start

### Local Development

#### With Docker (Recommended)
```bash
docker-compose up --build
# Access at: http://localhost:8080/eSportsTeamManagementSystem
```

#### With Maven
```bash
mvn clean tomcat:run
# Access at: http://localhost:8080/eSportsTeamManagementSystem
```

#### With Deployed Tomcat
```bash
deploy-windows.bat    # Windows
./deploy-unix.sh      # Linux/Mac
```

## Default Login

```
Username: AYUSH1234
Password: Ayush@2908
```

## Features

✅ **Team Management** - Create, edit, and manage eSports teams
✅ **Player Management** - Add players with roles and skill ratings
✅ **Tournament Management** - Organize and track tournaments
✅ **Match Scheduling** - Schedule matches and submit results
✅ **Admin Dashboard** - View statistics and leaderboards
✅ **Authentication** - Secure admin login system
✅ **Responsive UI** - Gaming-themed dark design

## Technology Stack

| Component | Version |
|-----------|---------|
| Java | 17 |
| Jakarta Servlet | 6.0 |
| MySQL | 8.0+ |
| Apache Tomcat | 10 |
| Maven | 3.6+ |

## Project Structure

```
eSportsTeamManagementSystem/
├── src/main/
│   ├── java/com/esports/
│   │   ├── dao/          # Data Access Objects
│   │   ├── model/        # Entity classes
│   │   └── web/          # Servlet controllers
│   ├── webapp/           # JSP templates & CSS
│   └── resources/        # Config & database script
├── pom.xml              # Maven configuration
├── Dockerfile           # Docker image
├── docker-compose.yml   # Docker multi-container setup
└── README.md            # Full documentation
```

## Database Setup

### Using MySQL CLI
```bash
mysql -u root -p < src/main/resources/database.sql
```

### Using Docker
The database is automatically initialized when using `docker-compose up`

### Default Configuration
```properties
db.url=jdbc:mysql://localhost:3306/esports_db?useSSL=false&serverTimezone=UTC
db.user=esports_user
db.pass=Esports@2025
```

Update these in `src/main/resources/app.properties` for your environment.

## Deployment Options

### Docker (Recommended)
```bash
docker build -t esports-system:latest .
docker run -p 8080:8080 -e DB_HOST=localhost esports-system:latest
```

### Apache Tomcat
1. Build: `mvn clean package`
2. Copy: `target/eSportsTeamManagementSystem.war` to `TOMCAT_HOME/webapps/`
3. Start: `TOMCAT_HOME/bin/catalina.bat start` (Windows)

### Cloud Platforms
- **Azure App Service**: Deploy WAR directly
- **AWS Elastic Beanstalk**: Use Tomcat platform
- **Heroku**: Use Procfile with Tomcat
- **DigitalOcean**: Docker support available

## Build Commands

```bash
# Clean and build
mvn clean package

# Build with tests
mvn clean package -Dskip Tests=false

# Run with embedded Tomcat
mvn clean tomcat:run

# Create Docker image
docker build -t esports-system:latest .

# Run with Docker Compose
docker-compose up --build
```

## API Endpoints

| Endpoint | Method | Purpose |
|----------|--------|---------|
| `/` | GET | Home page |
| `/login` | GET/POST | Admin login |
| `/logout` | GET | Admin logout |
| `/dashboard` | GET | Dashboard |
| `/team?action=list` | GET | List teams |
| `/team?action=form` | GET | Create team |
| `/player?action=list` | GET | List players |
| `/tournament?action=list` | GET | List tournaments |
| `/match?action=list` | GET | List matches |

## Troubleshooting

### Port 8080 Already in Use
```bash
# Windows
netstat -ano | findstr :8080
taskkill /PID <PID> /F

# Linux
lsof -i :8080
kill -9 <PID>
```

### Database Connection Error
- Ensure MySQL is running
- Verify credentials in `app.properties`
- Check database exists: `mysql -u root -p -e "SHOW DATABASES;"`

### Build Failures
```bash
# Clear Maven cache
mvn clean

# Check Java version
java -version  # Should be 17+

# Check Maven version
mvn -version   # Should be 3.6+
```

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Push to the branch
5. Submit a pull request

## License

This project is licensed under the Apache License 2.0

## Support

For issues and questions:
1. Check the [README.md](../README.md)
2. Review [DEPLOYMENT.md](../DEPLOYMENT.md)
3. Check logs in `TOMCAT_HOME/logs/catalina.out`

## Additional Resources

- [Jakarta EE Documentation](https://jakarta.ee/)
- [Apache Tomcat 10 Docs](https://tomcat.apache.org/tomcat-10.0-doc/)
- [MySQL Documentation](https://dev.mysql.com/doc/)
- [Maven Documentation](https://maven.apache.org/guides/)

---

**Version**: 1.0.0  
**Last Updated**: November 2025
