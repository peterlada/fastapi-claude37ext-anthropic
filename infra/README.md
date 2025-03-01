# Infrastructure as Code for Hello World App

This directory contains Terraform configurations for deploying the Hello World FastAPI application to DigitalOcean App Platform using a GitOps approach.

## Directory Structure

```bash
infra/
├── terraform/         # Terraform configuration files
├── env/               # Environment-specific variables
│   ├── dev/           # Development environment
│   └── prod/          # Production environment
└── README.md          # This file
```

## Prerequisites

1. [Terraform](https://www.terraform.io/downloads.html) installed locally (v1.0.0+)
2. DigitalOcean account with:
   - API token with write access
   - Container Registry set up
   - Spaces (S3-compatible storage) for Terraform state

## Required Secrets

The following secrets should be configured in your GitHub repository:

- `DO_INFRA_ACCESS_TOKEN`: Your DigitalOcean API token for gitops infra
- `DO_S3_ACCESS`: Access key for DigitalOcean Spaces for terraform state
- `DO_S3_SECRET`: Secret key for DigitalOcean Spaces for terraform state

## Setting Up the Infrastructure

### Manual Deployment

1. Navigate to the Terraform directory:

   ```bash
   cd infra/terraform
   ```

2. Initialize Terraform:

   ```bash
   terraform init \
     -backend-config="endpoint=https://nyc3.digitaloceanspaces.com" \
     -backend-config="bucket=infra-hello-world" \
     -backend-config="key=hello-world-app/dev/terraform.tfstate" \
     -backend-config="region=us-east-1" \
     -backend-config="access_key=YOUR_SPACES_ACCESS_KEY" \
     -backend-config="secret_key=YOUR_SPACES_SECRET_KEY" \
     -backend-config="skip_credentials_validation=true" \
     -backend-config="skip_region_validation=true" \
     -backend-config="force_path_style=true"
   ```

3. Apply Terraform configuration:

   ```bash
   terraform apply -var-file="../env/dev/terraform.tfvars" -var="do_token=YOUR_DO_INFRA_ACCESS_TOKEN"
   ```

### Using GitHub Actions

1. Push your changes to GitHub
2. Go to the "Actions" tab in your repository
3. Select the "Deploy to DigitalOcean" workflow
4. Click "Run workflow"
5. Select the environment (dev or prod) and image tag to deploy
6. Click "Run workflow" to start the deployment

## Environment Configuration

Environment-specific variables are stored in the `env/` directory. You can customize these files to adjust your deployment configuration for each environment.

## Terraform Resources

The Terraform configuration creates the following resources:

- DigitalOcean App Platform application
- DigitalOcean Project for organization

## Adding a New Environment

1. Create a new directory under `env/` with your environment name
2. Add a `terraform.tfvars` file with environment-specific values
3. Update the GitHub workflow to include your new environment in the options
