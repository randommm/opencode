# Opencode with tools

Just Opencode in a container with some tools.

## Usage:

```bash
podman run -it --rm \
  -v "$(pwd):/work$(pwd):Z" \
  -w "/work$(pwd)" \
  -v "$HOME/.opencode:/root/.opencode:Z" \
  -v "$HOME/.local/share/opencode:/root/.local/share/opencode:Z" \
  -v "$HOME/.local/state/opencode:/root/.local/state/opencode:Z" \
  -v "$HOME/.config/opencode:/root/.config/opencode:Z" \
  -v "$HOME/.cache/opencode:/root/.cache/opencode:Z" \
  --network host \
  --volume /tmp/.X11-unix:/tmp/.X11-unix:ro \
  --volume $HOME/.Xauthority:/root/.Xauthority:ro \
  --env DISPLAY=$DISPLAY \
  ghcr.io/randommm/opencode
```

You might need to create the dirs first:

```bash
mkdir -p \
  $HOME/.opencode \
  $HOME/.local/share/opencode \
  $HOME/.local/state/opencode \
  $HOME/.config/opencode \
  $HOME/.cache/opencode
```
