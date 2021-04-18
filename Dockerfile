# Pull base image
FROM python:3.9

LABEL maintainer = "Herson Melo <hersonpc@gmail.com>" \
      name = "python-oracle" \
      version = "0.1"

# Set environment varibles
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install OS dependencies
RUN apt-get -y update && apt-get install -y \
    build-essential \
    unzip \
    python-dev \
    libaio-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/

# Install Oracle Instant Client
RUN mkdir -p /opt/oracle && cd /opt/oracle
COPY bin/instantclient-basic-linux.x64-21.1.0.0.0.zip /opt/oracle/instantclient.zip
RUN cd /opt/oracle \
    && unzip /opt/oracle/instantclient.zip \
    && rm -rf /opt/oracle/instantclient.zip \
    && ln -s /opt/oracle/instantclient* /opt/oracle/instantclient

COPY src/bashrc /opt/oracle/env_vars
RUN cat /opt/oracle/env_vars >> ~/.bashrc \
    && rm -f /opt/oracle/env_vars

# Install Python dependencies
RUN pip install --no-cache-dir cx_Oracle

WORKDIR /app

COPY src/oracle_test.py /app
