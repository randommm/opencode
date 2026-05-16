# Opencode with tools

Just Opencode in a container with some tools.

## Usage:

```bash
podman run -it --rm \
  -v "$(pwd):/work$(pwd):Z" \
  -w "/work$(pwd)" \
  -v "$HOME/.local/share/opencode:/root/.local/share/opencode:Z" \
  -v "$HOME/.local/state/opencode:/root/.local/state/opencode:Z" \
  -v "$HOME/.config/opencode:/root/.config/opencode:Z" \
  -v "$HOME/.cache/opencode:/root/.cache/opencode:Z" \
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -v $HOME/.Xauthority:/root/.Xauthority:ro \
  -e DISPLAY=$DISPLAY \
  --security-opt=no-new-privileges \
  ghcr.io/randommm/opencode
```

You might need to create the dirs first:

```bash
mkdir -p \
  $HOME/.local/share/opencode \
  $HOME/.local/state/opencode \
  $HOME/.config/opencode \
  $HOME/.cache/opencode
```

You might also want to add more bind to you podman command, e.g.:

```bash
  -v $HOME/.cache/uv:/root/.cache/uv \
  -v $HOME/.local/share/uv:/root/.local/share/uv \
  -v $HOME/.cache/pip:/root/.cache/pip \
  -v $HOME/.cache/huggingface:/root/.cache/huggingface \
```

## Clipboard support

This line were added to enable clipboard support:

```bash
  -v /tmp/.X11-unix:/tmp/.X11-unix:ro \
  -v $HOME/.Xauthority:/root/.Xauthority:ro \
  -e DISPLAY=$DISPLAY \
```

If you don't use them, you will need an OSC52 compliant terminal for clipboard to work, e.g.: kitty, konsole, ghostty.
