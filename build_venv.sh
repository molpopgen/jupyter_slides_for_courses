#!/bin/bash

# NOTE: this script should
# be executed by source and not by sh!

if [ -d ./.venv ]
then
    rm -rf ./.venv
fi

python3 -m venv ./.venv
source ./.venv/bin/activate

pip install --upgrade pip

pip install -r requirements.txt

# See requirements.txt
# for why this is here.
pip install hide_code

# Install jupyter-black
jupyter contrib nbextension install  --sys-prefix

jupyter nbextension install --sys-prefix --py hide_code
jupyter nbextension enable --sys-prefix  --py hide_code
jupyter serverextension enable --sys-prefix --py hide_code

