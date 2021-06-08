FROM registry.access.redhat.io/ubi8/ubi
LABEL maintainer="Sean Nelson <snelson@redhat.com>"

USER 0

RUN dnf install -y git && \
    dnf install -y python38 && \
    pip3 install $ANSIBLE_PACKAGE && \
    dnf clean all

USER 1001
