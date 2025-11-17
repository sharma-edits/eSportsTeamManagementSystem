#!/bin/bash

# eSports Team Management System - Quick Deployment Script for Linux/Mac

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║     eSports Team Management System - Local Deployment          ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""

# Check if Maven is installed
if ! command -v mvn &> /dev/null; then
    echo "ERROR: Maven not found. Please install Maven from https://maven.apache.org/download.cgi"
    exit 1
fi

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "ERROR: Java not found. Please install Java 17"
    exit 1
fi

echo "[1/3] Cleaning and building project..."
echo ""
mvn clean package -DskipTests

if [ $? -ne 0 ]; then
    echo "ERROR: Build failed!"
    exit 1
fi

echo ""
echo "[2/3] Checking for Tomcat installation..."
echo ""

# Look for Tomcat
if [ -f "/opt/tomcat/bin/catalina.sh" ]; then
    TOMCAT_HOME="/opt/tomcat"
elif [ -f "$HOME/tomcat/bin/catalina.sh" ]; then
    TOMCAT_HOME="$HOME/tomcat"
else
    echo "WARNING: Tomcat not found in standard locations."
    echo ""
    echo "Please do ONE of the following:"
    echo ""
    echo "Option A: Use Docker (Recommended)"
    echo "  docker-compose up --build"
    echo ""
    echo "Option B: Install Tomcat 10"
    echo "  1. Download: https://tomcat.apache.org/download-10.cgi"
    echo "  2. Extract to /opt/tomcat or \$HOME/tomcat"
    echo "  3. Run this script again"
    echo ""
    echo "Option C: Use Maven embedded Tomcat"
    echo "  mvn clean tomcat:run"
    echo ""
    exit 0
fi

echo "Found Tomcat at: $TOMCAT_HOME"
echo ""
echo "[3/3] Deploying WAR file to Tomcat..."
echo ""

# Stop Tomcat if running
echo "Stopping Tomcat..."
"$TOMCAT_HOME/bin/catalina.sh" stop 2>/dev/null

# Wait for Tomcat to stop
sleep 3

# Copy WAR file
echo "Copying WAR file..."
cp "target/eSportsTeamManagementSystem.war" "$TOMCAT_HOME/webapps/"

if [ $? -ne 0 ]; then
    echo "ERROR: Failed to copy WAR file!"
    exit 1
fi

# Start Tomcat
echo "Starting Tomcat..."
"$TOMCAT_HOME/bin/catalina.sh" start

# Wait for Tomcat to start
echo ""
echo "Waiting for Tomcat to start (this may take 30-60 seconds)..."
sleep 15

echo ""
echo "╔════════════════════════════════════════════════════════════════╗"
echo "║             ✓ Deployment Complete!                             ║"
echo "╚════════════════════════════════════════════════════════════════╝"
echo ""
echo "Application is running at:"
echo "  URL: http://localhost:8080/eSportsTeamManagementSystem"
echo ""
echo "Login Credentials:"
echo "  Username: AYUSH1234"
echo "  Password: Ayush@2908"
echo ""
echo "To stop the application:"
echo "  Run: $TOMCAT_HOME/bin/catalina.sh stop"
echo ""
