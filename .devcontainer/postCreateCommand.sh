#! /usr/bin/env bash

# Create a virtual environment for the project and activate it
python3 -m venv /workspaces/cuddly-poetry-python/.venv
source /workspaces/cuddly-poetry-python/.venv/bin/activate

# Install Dependencies into the virtual environment
poetry install --with dev
