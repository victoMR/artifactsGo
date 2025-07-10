#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${BLUE}🚀 Starting deployment process...${NC}"
echo ""

# Docker build
echo -e "${YELLOW}🔨 Building Docker image...${NC}"
docker build -t us-central1-docker.pkg.dev/civil-orb-450705-i8/anime-api-repo/anime-api:latest .

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Docker image built successfully!${NC}"
else
    echo -e "${RED}❌ Docker build failed!${NC}"
    exit 1
fi

echo ""

# Docker push
echo -e "${YELLOW}📦 Pushing Docker image to registry...${NC}"
docker push us-central1-docker.pkg.dev/civil-orb-450705-i8/anime-api-repo/anime-api:latest

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Docker image pushed successfully!${NC}"
else
    echo -e "${RED}❌ Docker push failed!${NC}"
    exit 1
fi

echo ""

# Change to the terraform directory
echo -e "${BLUE}📁 Changing to terraform directory...${NC}"
cd terraform

# Terraform apply and capture output
echo -e "${YELLOW}🏗️  Applying Terraform changes...${NC}"
terraform_output=$(terraform apply -auto-approve 2>&1)
terraform_exit_code=$?

echo "$terraform_output"

if [ $terraform_exit_code -eq 0 ]; then
    # Check if Terraform made any changes
    if echo "$terraform_output" | grep -q "No changes"; then
        echo ""
        echo -e "${YELLOW}⚠️  Terraform detected no infrastructure changes${NC}"
        echo -e "${BLUE}🔄 Forcing manual Cloud Run deployment...${NC}"
        
        # Force Cloud Run deployment manually
        echo -e "${YELLOW}🚀 Deploying to Cloud Run manually...${NC}"
        gcloud run deploy anime-api \
            --image=us-central1-docker.pkg.dev/civil-orb-450705-i8/anime-api-repo/anime-api:latest \
            --region=us-central1 \
            --platform=managed \
            --allow-unauthenticated \
            --quiet
        
        if [ $? -eq 0 ]; then
            echo -e "${GREEN}✅ Manual Cloud Run deployment successful!${NC}"
        else
            echo -e "${RED}❌ Manual Cloud Run deployment failed!${NC}"
            exit 1
        fi
    else
        echo -e "${GREEN}✅ Terraform changes applied successfully!${NC}"
    fi
else
    echo -e "${RED}❌ Terraform apply failed!${NC}"
    exit 1
fi

echo ""
echo -e "${GREEN}🎉 Deployment completed successfully!${NC}"
echo ""
echo -e "${BLUE}🌐 Service URLs:${NC}"
echo -e "${GREEN}   Backend API: https://anime-api-2r3soktbma-uc.a.run.app/animes${NC}"
echo -e "${GREEN}   Frontend:    https://anime-api-2r3soktbma-uc.a.run.app/static/${NC}"
echo -e "${GREEN}   Root:        https://anime-api-2r3soktbma-uc.a.run.app/${NC}"
echo ""
echo -e "${YELLOW}💡 Test your deployment:${NC}"
echo -e "   curl https://anime-api-2r3soktbma-uc.a.run.app/animes"
echo ""
