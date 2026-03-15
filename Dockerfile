FROM ghcr.io/astral-sh/uv:python3.14-bookworm-slim AS dev

LABEL maintainer="TODO <todo@todo.todo>"
LABEL description="A special template"

ENV DEBIAN_FRONTEND=noninteractive
ENV UV_LINK_MODE=copy

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    bash-completion \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -g 1000 vscode \
 && useradd -m -u 1000 -g 1000 -s /bin/bash vscode

USER vscode

RUN echo 'source /app/.venv/bin/activate 2>/dev/null || true' >> ~/.bashrc
