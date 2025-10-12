# Python Standards & Guidelines

## Project Setup & Management
-   Always use `uv` for package management - never edit `pyproject.toml` manually
-   Initialize projects with `uv init` and manage dependencies with `uv add <package>`
-   Use `uv sync` to install dependencies and `uv run` to execute scripts
-   Create virtual environments automatically with `uv venv`

## Project/Code Structure
-   **File size limit**: Keep files under 300 lines - split into modules when approaching this limit.
-   **Modular design**: Separate concerns into logical modules (core, models, services, clients, utils, config, etc.)
-   Use the "src/ project layout" with clear folder structure: `src/`, `tests/`, `docs/`
-   Group related functionality in packages with `__init__.py` files

### Example Project Structure

```
project/                  # <-- root of the repository.
├── src/                  # <-- all importable code lives here
│   ├── core/             # Business logic, reusable across services
│   ├── api/              # FastAPI (or Flask, gRPC) endpoints
│   ├── data/             # ETL helpers, dataset loaders
│   ├── client/           # Clients. CLIs, GUIs, etc.
│   ├── utils/            # Tiny helpers: logging, timers, etc.
│   └── config/           # Configuration Management.
├── tests/                # <-- all tests (pytest) lives here
│   ├── unit/             # Unit tests
│   ├── integration/      # Integration tests
│   └── e2e/              # End-to-End tests.
├── docs/                 # <-- all documentation & guides (sphinx/markdown) lives here.
│   ├── api/
│   ├── usage/
│   └── development/
├── scripts/              # One-off CLI helpers, CI hooks, Bash scripts.
├── .github/workflows/    # CI/CD pipelines
├── .claude/              # Repository/project specific context for Claude Code.
├── Dockerfile            # Docker/container packaging.
├── docker-compose.yml    # Container orchestration.
├── Taskfile.yml          # `task test`, `task lint`, etc.
├── pyproject.toml        # Packaging + tool configs
├── README.md             # Repository README
├── CLAUDE.md             # Repository/project specific guidelines for Claude Code.
├── .env                  # For storing configuration in environment variables.
├── .gitignore            # Specifies which files/directories that should be ignored by git.
└── uv.lock               # Used by `uv`. Specifies exact project dependencies/requirements.
```

## Documentation Standards
-   Use inline docstrings for all functions and classes.
-   Follow Google/NumPy docstring format
-   Always add type hints for function parameters and return values
-   Include brief module-level docstrings explaining purpose.

## Preferred Packages/Dependencies
-   **FastAPI** for REST APIs.
-   **Flask** for web backends.
-   **python-dotenv** for environment variables.
-   **pytest** for testing.
-   **argparse** & **rich** for CLI applications.
-   **Spark** & **Airflow** for batch ETL pipelines.
-   **LangChain** for interacting with LLMs.
-   **Sphinx** for generating documentation.
-   **SQLite** for presistent storage.

## Best Practices
-   Load environment variables from `.env`, using `python-dotenv` at startup.
-   Implement proper error handling with custom exception classes.
-   Follow PEP 8 naming conventions
-   Write intuitive, clear and readable code. It should be easy to understand for both junior & experienced engineers.
-   Add comprehensive tests with good coverage
-   Use dependency injection pattern for FastAPI routes

## Commands Reference
```bash
uv init                   # Initialize project
uv add <package>          # Add dependency
uv add --dev <package>    # Add dev dependency
uv sync                   # Install dependencies
uv run <script>           # Run script
uvx ruff check src/       # Lint the entire code base.

task test                 # Run all tests
task run                  # Build the project and run it.
task docker               # Build the project and package it, using Docker.
```


## Dockerfile for Python projects

## Basic Structure

```dockerfile
# Stage 1: Build dependencies
FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim as builder

# Set working directory
WORKDIR /app

# Copy dependency files
COPY pyproject.toml uv.lock ./

# Install dependencies to a virtual environment
RUN uv sync --frozen --no-cache

# Stage 2: Runtime
FROM debian:bookworm-slim

# Install uv for runtime
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv

# Set working directory
WORKDIR /app

# Copy virtual environment from builder stage
COPY --from=builder /app/.venv /app/.venv

# Copy application code
COPY . .

# Ensure we use the virtual environment
ENV PATH="/app/.venv/bin:$PATH"

# Run the application
CMD ["uv", "run", "python", "main.py"]
```

## Key Benefits

- **Smaller final image**: Build dependencies aren't included in the final image
- **Faster builds**: UV's speed advantage for dependency resolution
- **Better caching**: Dependency installation is cached separately from code changes
- **Security**: No build tools in production image

## Essential Commands

### UV Installation
```dockerfile
# Use UV's Python images directly
FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim

# Or install UV on minimal base
FROM debian:bookworm-slim
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv
```

### Dependency Management
```dockerfile
# Sync dependencies (equivalent to pip install)
RUN uv sync --frozen --no-cache

# For production-only dependencies
RUN uv sync --frozen --no-cache --no-dev
```

### Environment Variables
```dockerfile
# Use the virtual environment
ENV PATH="/app/.venv/bin:$PATH"

# Optional: Set UV cache directory
ENV UV_CACHE_DIR=/tmp/uv-cache
```

## Advanced Example

```dockerfile
# Build stage
FROM ghcr.io/astral-sh/uv:python3.12-bookworm-slim as builder

# Install system dependencies for building
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Copy and install dependencies
COPY pyproject.toml uv.lock ./
RUN uv sync --frozen --no-cache --no-dev

# Production stage
FROM debian:bookworm-slim

# Install uv and runtime dependencies
COPY --from=ghcr.io/astral-sh/uv:latest /uv /bin/uv
RUN apt-get update && apt-get install -y \
    && rm -rf /var/lib/apt/lists/*

# Create non-root user
RUN useradd --create-home --shell /bin/bash app

WORKDIR /app

# Copy virtual environment
COPY --from=builder /app/.venv /app/.venv

# Copy application code
COPY --chown=app:app . .

# Switch to non-root user
USER app

# Activate virtual environment
ENV PATH="/app/.venv/bin:$PATH"

EXPOSE 8000

CMD ["uv", "run", "python", "main.py"]
```

## Tips

1. **Order matters**: Copy `pyproject.toml` and `uv.lock` before application code for better caching
2. **Use `--frozen`**: Ensures exact dependency versions from lockfile
3. **Use `--no-cache`**: Prevents UV cache from bloating the image
4. **Consider `--no-dev`**: Skip development dependencies in production
5. **Set PATH**: Ensure the virtual environment is activated properly
