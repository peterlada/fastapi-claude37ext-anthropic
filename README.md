# Hello World FastAPI Application

A simple "Hello World" web application built with Python 3.12 and FastAPI.

## Features

- Modern Python 3.12
- FastAPI framework
- UV package management
- Ruff for linting
- Pytest for testing

## Setup

### Prerequisites

- Python 3.12 or higher
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
docker run -p 8000:8000 hello-world-app
```

Then access the application at `http://localhost:8000`.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
