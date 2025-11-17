# Multi-stage build for eSports Team Management System

# Stage 1: Build with Maven
FROM maven:3.9-eclipse-temurin-17 as builder

WORKDIR /app

# Copy project files
COPY pom.xml .
COPY src/ src/

# Build application
RUN mvn clean package -DskipTests

# Stage 2: Runtime with Tomcat 10
FROM tomcat:10.1-jdk17-eclipse-temurin

# Set working directory
WORKDIR $CATALINA_HOME

# Copy WAR file from builder
COPY --from=builder /app/target/eSportsTeamManagementSystem.war webapps/

# Expose port
EXPOSE 8080

# Environment variables (set at runtime)
ENV DB_HOST=localhost
ENV DB_PORT=3306
ENV DB_NAME=esports_db
ENV DB_USER=esports_user
ENV DB_PASSWORD=Esports@2025

# Run Tomcat
CMD ["catalina.sh", "run"]
