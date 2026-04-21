FROM ghcr.io/randommm/opencode-fork:latest

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

RUN apk add --no-cache \
  bash python3 ripgrep \
  git curl wget \
  build-base linux-headers \
  libffi-dev openssl-dev \
  cargo rust go \
  nodejs npm fd \
  jq py3-pip xclip \
  zip unzip tar gzip openssh-client \
  github-cli vim nano eza fzf shellcheck yamllint \
  docker kubectl sqlite postgresql-client \
  htop tmux

ENTRYPOINT ["opencode"]
