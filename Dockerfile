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
        wget

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN wget https://github.com/w3shaman/diabetes-detection/archive/main.zip \
    && unzip main.zip \
    && mv diabetes-detection-main/.[!.]* . \
    && rmdir diabetes-detection-main \
    && apk del \
        .builddeps

EXPOSE 5000
VOLUME ["/usr/src/app/models"]

ENTRYPOINT [ "python", "diabetes_early_detection.py" ]
