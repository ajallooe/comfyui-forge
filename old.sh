#!/bin/bash
sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y git wget curl zip unzip python3 python3-venv python3-dev libgl1 libglib2.0-0 ffmpeg build-essential cmake sudo
python3 -m ensurepip --upgrade
python3 -m pip install --upgrade pip
python3 -m venv ~/venv-comfy
source ~/venv-comfy/bin/activate
pip install --pre torch torchvision torchaudio --index-url https://download.pytorch.org/whl/whl/cu121
pip install jupyterlab notebook ipywidgets
mkdir -p ~/workspace
cd ~/workspace
git clone https://github.com/comfyanonymous/ComfyUI.git
cd ComfyUI
pip install -r requirements.txt
cd custom_nodes
git clone https://github.com/ltdrdata/ComfyUI-Manager comfyui-manager
cd ..
python main.py --listen --port 8188
