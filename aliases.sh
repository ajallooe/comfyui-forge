#!/bin/bash
# ===========================
# Aliases for ComfyUI, JupyterLab, and Forge
# ===========================

# Export Workspace Variable
export WORKSPACE=$(eval echo ~/workspace)

# ComfyUI
alias launch_comfy='cd $WORKSPACE/ComfyUI && source ~/venv-comfy/bin/activate && python main.py --listen --port 8188'

# JupyterLab for ComfyUI venv
alias launch_jupyter='source ~/venv-comfy/bin/activate && jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token="" --NotebookApp.password=""'

# Forge (Only if installed later)
alias launch_forge='cd $WORKSPACE/forge && source ~/venv-forge/bin/activate && ./webui.sh'

