FROM ghcr.io/astral-sh/uv:python3.14-bookworm-slim AS dev

LABEL maintainer="TODO <todo@todo.todo>"
LABEL description="A special template"

ENV DEBIAN_FRONTEND=noninteractive
ENV UV_LINK_MODE=copy
ENV PYTHONUNBUFFERED=1

WORKDIR /workspaces

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    bash-completion \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid 1000 vscode \
 && useradd --uid 1000 --gid 1000 -ms /bin/bash vscode

USER vscode

RUN echo 'if [ -f .venv/bin/activate ]; then source .venv/bin/activate; fi' >> ~/.bashrc
