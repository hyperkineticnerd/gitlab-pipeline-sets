#!/usr/bin/bash

function subtree_repos() {
    # git remote add github git@github.com:hyperkineticnerd/gitlab-pipeline-sets.git
    git remote add subtree_pipelines git@gitlab.developer.hkn.lab:gitlab-pipelines/pipelines.git
    git remote add subtree_helpers git@gitlab.developer.hkn.lab:gitlab-pipelines/helpers.git
    git remote add subtree_ansible-slack git@gitlab.developer.hkn.lab:gitlab-pipelines/ansible/slack.git
    git remote add subtree_containers-ansible git@gitlab.developer.hkn.lab:gitlab-pipelines/containers/ansible.git
    git remote add subtree_containers-podman git@gitlab.developer.hkn.lab:gitlab-pipelines/containers/podman.git
    git remote add subtree_containers-container-build git@gitlab.developer.hkn.lab:gitlab-pipelines/containers/container-build.git
}

function subtree_fetch() {
    # git fetch github
    git fetch subtree_pipelines
    git fetch subtree_helpers
    git fetch subtree_ansible-slack
    git fetch subtree_containers-ansible
    git fetch subtree_containers-podman
    git fetch subtree_containers-container-build
}

function subtree_add() {
    git subtree add --prefix=gitlab-pipelines/pipelines subtree_pipelines master
    git subtree add --prefix=gitlab-pipelines/helpers subtree_helpers master
    git subtree add --prefix=gitlab-pipelines/ansible/slack subtree_ansible-slack master
    git subtree add --prefix=gitlab-pipelines/containers/ansible subtree_containers-ansible master
    git subtree add --prefix=gitlab-pipelines/containers/podman subtree_containers-podman master
    git subtree add --prefix=gitlab-pipelines/containers/container-build subtree_containers-container-build master
}

function subtree_pull() {
    git subtree pull --squash --prefix=gitlab-pipelines/pipelines subtree_pipelines master
    git subtree pull --squash --prefix=gitlab-pipelines/helpers subtree_helpers master
    git subtree pull --squash --prefix=gitlab-pipelines/ansible/slack subtree_ansible-slack master
}

function container_pull() {
    git subtree pull --squash --prefix=gitlab-pipelines/containers/ansible subtree_containers-ansible master
    git subtree pull --squash --prefix=gitlab-pipelines/containers/podman subtree_containers-podman master
    git subtree pull --squash --prefix=gitlab-pipelines/containers/container-build subtree_containers-container-build master
}

function examples_pull() {
    git subtree pull --squash --prefix pipeline-examples/python-seed-app git@gitlab.developer.hkn.lab:pipeline-examples/python-seed-app.git master
}

function subtree_push() {
    git subtree push --prefix gitlab-pipelines/pipelines subtree_pipelines master
    git subtree push --prefix gitlab-pipelines/helpers subtree_helpers master
    git subtree push --prefix=gitlab-pipelines/ansible/slack subtree_ansible-slack master
}

function container_push() {
    git subtree push --prefix gitlab-pipelines/containers/ansible subtree_containers-ansible master --rejoin
    git subtree push --prefix gitlab-pipelines/containers/podman subtree_containers-podman master
    git subtree push --prefix=gitlab-pipelines/containers/container-build subtree_containers-container-build master
}

function examples_push() {
    git subtree push --prefix pipeline-examples/python-seed-app git@gitlab.developer.hkn.lab:pipeline-examples/python-seed-app.git master
}

if [[ $# -eq 0 ]]; then
    echo "$0 [repo | fetch | add | pull | pull-c | push | push-c | push-ex]"
    exit 0
fi

while [[ $# -gt 0 ]]; do
    key="${1}"
    case $key in
        repo)
        subtree_repos
        shift
        ;;

        fetch)
        subtree_fetch
        shift
        ;;

        add)
        subtree_add
        shift
        ;;

        pull)
        subtree_pull
        shift
        ;;

        pull-c)
        container_pull
        shift
        ;;

        pull-ex)
        examples_pull
        shift
        ;;

        push)
        subtree_push
        shift
        ;;

        push-c)
        container_push
        shift
        ;;

        push-ex)
        examples_push
        shift
        ;;

        *)
        shift
        ;;
    esac
done
