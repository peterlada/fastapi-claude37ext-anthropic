FROM ghcr.io/astral-sh/uv:python3.13-bookworm-slim

WORKDIR /app

# Environment variables

# Enable bytecode compilation
ENV UV_COMPILE_BYTECODE=1

# Copy from the cache instead of linking since it's a mounted volume
ENV UV_LINK_MODE=copy
ENV UV_NO_CACHE=1
ENV UV_SYSTEM_PYTHON=1

# Install project dependencies using the lockfile and settings
RUN --mount=type=cache,target=/root/.cache/uv \
    --mount=type=bind,source=uv.lock,target=uv.lock \
    --mount=type=bind,source=pyproject.toml,target=pyproject.toml \
    uv sync --frozen --no-install-project --no-dev

# Then, add the rest of the project source code and install it
# Installing separately from its dependencies allows optimal layer caching
ADD . /app
RUN --mount=type=cache,target=/root/.cache/uv \
    uv sync --frozen --no-dev

# Expose the port the app runs on
EXPOSE 80

# Place executables in the environment at the front of the path
ENV PATH="/app/.venv/bin:$PATH"

# Reset the entrypoint, don't invoke `uv`
ENTRYPOINT []

# Run the FastAPI application by default
# Uses `--host 0.0.0.0` to allow access from outside the container
CMD ["fastapi", "run", "src/app/main.py", "--host", "0.0.0.0", "--port", "80"]
