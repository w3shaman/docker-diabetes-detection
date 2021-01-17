FROM python:3.9.1-slim-buster

WORKDIR /usr/src/app

RUN set -ex \
    \
    && savedAptMark="$(apt-mark showmanual)" \
    && apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        libfreetype6-dev \
        gfortran \
        libopenblas-dev \
        pkgconf \
        python3-dev \
        libffi-dev \
        wget

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN wget https://github.com/w3shaman/diabetes-detection/archive/7c1900d530808594df0643386b9b46efba4af8e0.zip \
    && unzip 7c1900d530808594df0643386b9b46efba4af8e0.zip \
    && cp -r diabetes-detection-7c1900d530808594df0643386b9b46efba4af8e0/* . \
    && rm -fr diabetes-detection-7c1900d530808594df0643386b9b46efba4af8e0 \
    && rm 7c1900d530808594df0643386b9b46efba4af8e0.zip

RUN set -ex \
    \
    && apt-mark auto '.*' > /dev/null; \
    && apt-mark manual $savedAptMark \
    && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false \
    && apt-get update && apt-get install -y --no-install-recommends \
        libopenblas-dev \
        tk \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 5000

ENTRYPOINT [ "python", "diabetes_early_detection.py" ]
