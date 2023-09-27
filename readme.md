# Stable Diffusion web UI on Docker with Apple silicon macOS

This repository is aimed at getting Stable Diffusion web UI running on Apple silicon mac's Docker.

## Usage

```sh
docker build -t stable-diffusion-webui .
```

```sh
docker run -p 7860:7860 -it stable-diffusion-webui
```
