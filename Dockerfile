FROM ghcr.io/randommm/opencode-fork:ubuntu

COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

RUN apt-get update && apt-get install -y --no-install-recommends \
  bash python3 ripgrep \
  git curl wget ca-certificates gnupg \
  build-essential linux-headers-generic \
  libffi-dev libssl-dev \
  cargo rustc golang-go \
  nodejs npm fd-find \
  jq python3-pip xclip \
  zip unzip tar gzip openssh-client \
  gh vim nano eza fzf shellcheck yamllint \
  docker.io sqlite3 postgresql-client \
  htop tmux \
 && mkdir -p /etc/apt/keyrings \
 && curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.30/deb/Release.key \
  | gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg \
 && echo "deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.30/deb/ /" \
  > /etc/apt/sources.list.d/kubernetes.list \
 && apt-get update \
 && apt-get install -y --no-install-recommends kubectl \
 && ln -s /usr/bin/fdfind /usr/local/bin/fd \
 && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["opencode"]
