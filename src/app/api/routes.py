"""API routes for the Hello World application."""

from fastapi import APIRouter, HTTPException, status

router = APIRouter(prefix="/api", tags=["api"])


@router.get("/hello")
async def hello() -> dict[str, str]:
    """Simple Hello endpoint.

    Returns:
        dict: A dictionary containing a greeting message.
    """
    return {"message": "Hello from the API!"}


@router.get("/hello/{name}")
async def hello_name(name: str) -> dict[str, str]:
    """Personalized Hello endpoint.

    Args:
        name: The name to include in the greeting.

    Returns:
        dict: A dictionary containing a personalized greeting message.

    Raises:
        HTTPException: If the name is empty or contains only whitespace.
    """
    if not name or name.strip() == "":
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Name cannot be empty or contain only whitespace",
        )
    return {"message": f"Hello, {name}!"}