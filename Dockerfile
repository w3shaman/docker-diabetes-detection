FROM python:3.9.1-alpine

WORKDIR /usr/src/app

RUN set -x \
    && apk update \
    && apk --no-cache add --virtual .builddeps \
        build-base \
        freetype-dev \
        gfortran \
        openblas-dev \
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

RUN apk del \
    .builddeps

RUN apk --no-cache add \
    tk \
    openblas-dev

EXPOSE 5000

ENTRYPOINT [ "python", "diabetes_early_detection.py" ]
