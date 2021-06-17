FROM python:3.8.10-alpine3.13
ARG VCS_REF
ARG BUILD_DATE
ARG VERSION
ARG USER_EMAIL="jack.crosnier@w6d.io"
ARG USER_NAME="Jack CROSNIER"
LABEL maintainer="${USER_NAME} <${USER_EMAIL}>" \
        org.label-schema.vcs-ref=$VCS_REF \
        org.label-schema.vcs-url="https://github.com/w6d-io/docker-bash" \
        org.label-schema.build-date=$BUILD_DATE \
        org.label-schema.version=$VERSION

ENV DESIRED_VERSION $DESIRED_VERSION

RUN apt update
RUN apt -y install git && git --version
RUN apt -y install curl
RUN apt -y install wget
RUN apt -y install tar
RUN python3 -m ensurepip
RUN python3 -m pip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN echo $PATH
RUN ls -la ~/
# run the entrypoint (only when the image is instantiated into a container)
ENTRYPOINT ["/bin/bash", "-c", "codecov"]
