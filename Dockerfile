FROM openjdk:11.0.11-jre-slim-buster as builder

# Add Dependencies for PySpark
RUN apt-get update && \
    apt-get install -y curl vim wget software-properties-common ssh git net-tools \
    ca-certificates libgmp-dev libffi-dev build-essential unixodbc-dev \
    python3 python3-pip python3-venv

RUN update-alternatives --install "/usr/bin/python" "python" "$(which python3)" 1

# Setup app dev environment and codebas
RUN mkdir /StreamingApp
WORKDIR /StreamingApp

COPY ./requirements.txt ./requirements.txt
RUN pip3 install --upgrade setuptools pip
RUN pip3 install -r requirements.txt