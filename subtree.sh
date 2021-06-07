#!/usr/bin/bash

# git remote add github git@github.com:hyperkineticnerd/gitlab-pipeline-sets.git
# git remote add subtree_pipelines git@gitlab.developer.hkn.lab:gitlab-pipelines/pipelines.git
# git remote add subtree_helpers git@gitlab.developer.hkn.lab:gitlab-pipelines/helpers.git
# git remote add subtree_containers-podman git@gitlab.developer.hkn.lab:gitlab-pipelines/containers/podman.git
# git remote add subtree_containers-container-build git@gitlab.developer.hkn.lab:gitlab-pipelines/containers/container-build.git

# git fetch github
# git fetch subtree_pipelines
# git fetch subtree_helpers
# git fetch subtree_containers-podman
# git fetch subtree_containers-container-build

# git subtree add --prefix=gitlab-pipelines/pipelines subtree_pipelines master --squash
# git subtree add --prefix=gitlab-pipelines/helpers subtree_helpers master --squash
# git subtree add --prefix=gitlab-pipelines/containers/podman subtree_containers-podman master --squash
# git subtree add --prefix=gitlab-pipelines/containers/container-build subtree_containers-container-build master --squash

# git subtree push --prefix gitlab-pipelines/pipelines pipelines master
# git subtree push --prefix gitlab-pipelines/helpers helpers master
# git subtree push --prefix gitlab-pipelines/containers/podman containers-podman master
