FROM registry.access.redhat.io/ubi8/ubi
LABEL maintainer="Sean Nelson <snelson@redhat.com>"

USER 0

RUN dnf module install -y container-tools --skip-broken && \
    dnf install -y buildah podman skopeo && \
    dnf clean all

USER 1001
