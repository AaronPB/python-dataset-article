FROM ghcr.io/astral-sh/uv:python3.14-bookworm-slim AS dev

LABEL maintainer="TODO <todo@todo.todo>"
LABEL description="A special template"

ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /workspaces

RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    bash-completion \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash vscode

USER vscode

RUN echo 'if [ -f .venv/bin/activate ]; then source .venv/bin/activate; fi' >> ~/.bashrc
