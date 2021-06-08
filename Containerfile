FROM registry.access.redhat.com/ubi8/ubi

USER 0
RUN echo "enabled=0" >> /etc/yum/pluginconf.d/subscripton-manager.conf
RUN dnf install -y git python38
RUN pip3 install ansible==2.9.21
RUN dnf clean all

# USER 1001
# ENTRYPOINT ["/bin/bash"]
# ENTRYPOINT ["/bin/sh", "-c"]
