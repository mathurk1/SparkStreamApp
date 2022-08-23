#!/bin/bash

# the below two statements is needed only to allow root users to run jupyter notebooks
# this is only needed for running the scripts inside of docker container
# if you are running this repo directly on your local, please ignore this file
jupyter notebook --generate-config
echo "c.NotebookApp.allow_root=True" >> /root/.jupyter/jupyter_notebook_config.py
sleep infinity