FROM registry.redhat.io/ubi8/ubi

RUN dnf install -y git ansible

USER 1001
