FROM python:3.10-slim-bullseye

ARG DP_CGANS_VERSION=0.0.6
ARG MATPLOTLIB_VERSION=3.9.2
ARG RDT_VERSION=1.9.0
ARG SDV_VERSION=1.6.0

# Fetch package lists, upgrade packages and pip, install dp-cgans and remove apt cache
RUN apt-get update && \
    apt-get upgrade -y && \
    pip install --upgrade pip && \
    rm -rf /var/lib/apt/lists/*

RUN pip --default-timeout=1000 install dp-cgans==${DP_CGANS_VERSION} \
    matplotlib==${MATPLOTLIB_VERSION} rdt==${RDT_VERSION} \
    sdv==${SDV_VERSION}


ENTRYPOINT ["dp-cgans"]