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
        make \
        musl-dev \
        wget

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

RUN wget https://github.com/w3shaman/diabetes-detection/archive/950cec36971c181fca7a7dec4454afcbc62b713a.zip \
    && unzip 950cec36971c181fca7a7dec4454afcbc62b713a.zip \
    && cp -r diabetes-detection-950cec36971c181fca7a7dec4454afcbc62b713a/* . \
    && rm -fr diabetes-detection-950cec36971c181fca7a7dec4454afcbc62b713a \
    && rm 950cec36971c181fca7a7dec4454afcbc62b713a.zip

RUN apk del \
    .builddeps

RUN apk --no-cache add \
    tk \
    openblas-dev

EXPOSE 5000

ENTRYPOINT [ "python", "diabetes_early_detection.py" ]
