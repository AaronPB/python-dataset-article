FROM ghcr.io/astral-sh/uv:python3.14-bookworm-slim AS dev

LABEL maintainer="TODO <todo@todo.todo>"
LABEL description="A special template"

WORKDIR /app

ENV UV_LINK_MODE=copy
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    bash-completion \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd --system --gid 1000 vscode \
 && useradd --system --gid 1000 --uid 1000 --create-home vscode

COPY --chown=vscode:vscode pyproject.toml uv.lock* ./

RUN --mount=type=cache,target=/home/vscode/.cache/uv \
    uv sync --locked --no-install-project

COPY --chown=vscode:vscode . .

USER vscode

RUN echo 'source /app/.venv/bin/activate' >> /home/vscode/.bashrc