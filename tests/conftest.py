"""Pytest configuration for the Hello World application."""

import pytest
from fastapi.testclient import TestClient

from app.main import app


@pytest.fixture
def client():
    """Create a test client for the FastAPI application.

    Returns:
        TestClient: A test client for the FastAPI application.
    """
    return TestClient(app)
