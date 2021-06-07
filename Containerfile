FROM registry.access.redhat.com/ubi8/ubi:8.4
# Maybe use ubi8/buildah:8.4 or ubi8/python-38

USER root
RUN echo "enabled=0" >> /etc/yum/pluginconf.d/subscripton-manager.conf
RUN dnf install -y git podman

USER build
