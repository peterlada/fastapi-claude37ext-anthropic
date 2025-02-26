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

1. Clone the repository

```bash
git clone https://github.com/yourusername/hello_world_app.git
cd hello_world_app
```

2. Create a virtual environment and install dependencies with UV

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
uvicorn src.hello_world_app.main:app --reload
```

Open your browser and navigate to http://127.0.0.1:8000 to see the "Hello World" message.

API documentation is available at:
- http://127.0.0.1:8000/docs (Swagger UI)
- http://127.0.0.1:8000/redoc (ReDoc)

## Development

### Linting

```bash
ruff check .
ruff format .
```

### Testing

```bash
pytest
```

## License

This project is licensed under the MIT License - see the LICENSE file for details.
