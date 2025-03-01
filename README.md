# Hello World FastAPI Application

A simple "Hello World" web application built with Python 3.13 and FastAPI.

## Features

- Modern Python 3.13
- FastAPI framework
- UV package management
- Ruff for linting
- Pytest for testing

## Setup

### Prerequisites

- Python 3.13 or higher
- UV package manager

### Installation

1. Create a virtual environment and install dependencies with UV

```bash
# Install UV if you don't have it already
curl -LsSf https://astral.sh/uv/install.sh | sh

# Create a virtual environment and install dependencies
uv venv
source .venv/bin/activate  # On Windows, use: .venv\Scripts\activate
uv pip install -e ".[dev]"
```

## Usage

Run the application locally:

```bash
uvicorn src.app.main:app --reload
```

Open your browser and navigate to `http://127.0.0.1:8000` to see the "Hello World" message.

API documentation is available at:

- `http://127.0.0.1:8000/docs` (Swagger UI)
- `http://127.0.0.1:8000/redoc` (ReDoc)

## Development

### Linting

The linting workflow runs on every push and pull request to the `main` branch, checking code quality with Ruff:

```bash
# To run linting locally:
ruff check .
ruff format .
```

### Testing

The testing workflow runs pytest on every push and pull request to the `main` branch:

```bash
# To run tests locally:
pytest
```

## CI/CD

This project uses GitHub Actions for continuous integration and deployment:

### Docker Deployment

The Docker workflow builds and pushes a Docker image to DigitalOcean Container Registry when:

- Changes are pushed to the `main` branch
- A new tag is created (e.g., v1.0.0)
- The workflow is manually triggered

#### Docker Usage

You can build and run the Docker image locally:

```bash
# Build the image
docker build -t hello-world-app .

# Run the container
docker run -p 8000:80 hello-world-app
```

Then access the application at `http://localhost:8000`.

### Deployment to DigitalOcean

The project uses a GitOps approach for deploying to DigitalOcean App Platform:

1. Infrastructure is defined as code using Terraform in the `infra/` directory
2. Environment-specific configurations are in `infra/env/`
3. GitHub Actions workflow handles deployment to different environments

To deploy:

1. Go to the "Actions" tab in your repository
2. Select the "Deploy to DigitalOcean" workflow
3. Click "Run workflow"
4. Select the environment (dev or prod) and image tag to deploy
5. Click "Run workflow" to start the deployment

For more details on the infrastructure setup, see [infra/README.md](infra/README.md).
