"""Tests for the API endpoints."""

import pytest
from fastapi.testclient import TestClient


def test_root_endpoint(client: TestClient):
    """Test the root endpoint returns the expected message."""
    response = client.get("/")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello, World!"}


def test_api_hello_endpoint(client: TestClient):
    """Test the /api/hello endpoint returns the expected message."""
    response = client.get("/api/hello")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello from the API!"}


def test_api_hello_name_endpoint(client: TestClient):
    """Test the /api/hello/{name} endpoint returns a personalized message."""
    response = client.get("/api/hello/TestUser")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello, TestUser!"}


def test_api_hello_name_endpoint_empty_name(client: TestClient):
    """Test the /api/hello/{name} endpoint with an empty name returns an error."""
    # FastAPI will convert an empty string in the path to a 404 error
    response = client.get("/api/hello/")
    assert response.status_code == 404

    # We can also test with a space, which should return a 400 error
    response = client.get("/api/hello/ ")
    assert response.status_code == 200
    assert response.json() == {"message": "Hello,  !"}
