FROM kaldiasr/kaldi:gpu-latest
LABEL maintainer="mdoulaty@gmail.com"

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        xmlstarlet \
        gawk

WORKDIR /opt/kaldi/
