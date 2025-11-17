@echo off
REM eSports Team Management System - Quick Deployment Script for Windows

echo.
echo ╔════════════════════════════════════════════════════════════════╗
echo ║     eSports Team Management System - Local Deployment          ║
echo ╚════════════════════════════════════════════════════════════════╝
echo.

REM Check if Maven is installed
mvn --version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Maven not found. Please install Maven from https://maven.apache.org/download.cgi
    pause
    exit /b 1
)

REM Check if Java is installed
java -version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Java not found. Please install Java 17 from https://www.oracle.com/java/technologies/downloads/
    pause
    exit /b 1
)

echo [1/3] Cleaning and building project...
echo.
mvn clean package -DskipTests

if errorlevel 1 (
    echo ERROR: Build failed!
    pause
    exit /b 1
)

echo.
echo [2/3] Checking for Tomcat installation...
echo.

REM Look for Tomcat
if exist "C:\tomcat\bin\catalina.bat" (
    set TOMCAT_HOME=C:\tomcat
) else if exist "C:\Program Files\Apache Software Foundation\Tomcat 10\bin\catalina.bat" (
    set TOMCAT_HOME=C:\Program Files\Apache Software Foundation\Tomcat 10
) else (
    echo WARNING: Tomcat not found in standard locations.
    echo.
    echo Please do ONE of the following:
    echo.
    echo Option A: Use Docker (Recommended if Docker is installed)
    echo   docker-compose up --build
    echo.
    echo Option B: Install Tomcat 10
    echo   1. Download: https://tomcat.apache.org/download-10.cgi
    echo   2. Extract to C:\tomcat
    echo   3. Run this script again
    echo.
    echo Option C: Use Maven embedded Tomcat
    echo   mvn clean tomcat:run
    echo.
    pause
    exit /b 0
)

echo Found Tomcat at: %TOMCAT_HOME%
echo.
echo [3/3] Deploying WAR file to Tomcat...
echo.

REM Stop Tomcat if running
echo Stopping Tomcat...
call "%TOMCAT_HOME%\bin\catalina.bat" stop >nul 2>&1

REM Wait for Tomcat to stop
timeout /t 3 /nobreak >nul

REM Copy WAR file
echo Copying WAR file...
copy "target\eSportsTeamManagementSystem.war" "%TOMCAT_HOME%\webapps\" >nul

if errorlevel 1 (
    echo ERROR: Failed to copy WAR file!
    pause
    exit /b 1
)

REM Start Tomcat
echo Starting Tomcat...
call "%TOMCAT_HOME%\bin\catalina.bat" start

REM Wait for Tomcat to start
echo.
echo Waiting for Tomcat to start (this may take 30-60 seconds)...
timeout /t 10 /nobreak >nul

echo.
echo ╔════════════════════════════════════════════════════════════════╗
echo ║             ✓ Deployment Complete!                             ║
echo ╚════════════════════════════════════════════════════════════════╝
echo.
echo Application is running at:
echo   URL: http://localhost:8080/eSportsTeamManagementSystem
echo.
echo Login Credentials:
echo   Username: AYUSH1234
echo   Password: Ayush@2908
echo.
echo Press any key to open the application in your browser...
pause >nul

REM Open browser
start http://localhost:8080/eSportsTeamManagementSystem

echo.
echo Deployment Summary:
echo   - Build Status: SUCCESS
echo   - WAR Location: %TOMCAT_HOME%\webapps\eSportsTeamManagementSystem.war
echo   - Tomcat Home: %TOMCAT_HOME%
echo.
echo To stop the application:
echo   Run: %TOMCAT_HOME%\bin\catalina.bat stop
echo.
pause
