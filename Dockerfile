FROM docker.io/ubuntu

RUN apt-get update && apt-get install -y --no-install-recommends \
  bash python3 ripgrep \
  git curl wget ca-certificates gnupg \
  build-essential linux-headers-generic \
  libffi-dev libssl-dev \
  cargo rustc golang-go \
  nodejs npm fd-find elan \
  jq python3-pip xclip python-is-python3 \
  zip unzip tar gzip openssh-client \
  gh vim nano eza fzf shellcheck yamllint \
  docker.io sqlite3 postgresql-client \
  htop tmux clang default-jdk auto-apt-proxy

RUN mkdir -p /etc/apt/keyrings \
  && curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key \
  | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg \
  && echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /" \
  > /etc/apt/sources.list.d/kubernetes.list \
  && apt-get update \
  && apt-get install -y --no-install-recommends kubectl

RUN curl -LsSf https://astral.sh/uv/install.sh | sh

RUN curl -fsSL https://opencode.ai/install | bash

ENV PATH="/root/.opencode/bin:/root/.local/bin:${PATH}"

ARG CACHEBUST
RUN echo "CACHEBUST=$CACHEBUST" >/dev/null && \
  apt-get update && apt-get upgrade -y && \
  opencode upgrade && uv self update

RUN ln -s /usr/bin/fdfind /usr/local/bin/fd

ENTRYPOINT ["opencode"]
