#!/usr/bin/env bash
set -e

echo "Building eSports Team Management System..."
npm run build

echo "Deploying to Firebase Hosting..."
npx firebase-tools deploy --only hosting --token "$FIREBASE_TOKEN"

echo "Deployment complete!"
