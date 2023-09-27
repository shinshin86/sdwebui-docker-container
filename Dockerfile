FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y git software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update && \
    apt-get install -y ffmpeg libsm6 libxext6 python3.10 python3-pip python3.10-venv

RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.10 1

# Create a user since it is not possible to run as root
RUN useradd -m sdwebui

# Setup Stable Diffusion web UI
RUN git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui /home/sdwebui/stable-diffusion-webui
WORKDIR /home/sdwebui/stable-diffusion-webui
RUN chmod +x ./webui.sh && chown -R sdwebui:sdwebui /home/sdwebui
USER sdwebui

CMD ["./webui.sh", "--listen", "--skip-torch-cuda-test", "--precision", "full", "--no-half", "--allow-code", "--enable-insecure-extension-access", "--api", "--theme", "dark"]
