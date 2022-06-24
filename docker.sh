#!/bin/bash
##################################################################
####    Build config
##################################################################
CONFIG_DOCKER_FILE="Dockerfile"
CONFIG_DOCKER_REPO="test"
CONFIG_DOCKER_TAG="0.1"
CONFIG_DOCKER_USER="docker"
##################################################################
####    Variables
##################################################################
VAR_HOST_PASTHROUGH_PATH=""
VAR_CONTAINER_PASTHROUGH_PATH="/mnt/work"

##################################################################
##################################################################
####    Base Functions
##################################################################
##################################################################
function fPrint_title()
{
    echo "##################################################################"
    echo "##################################################################"
    echo "####    $@"
    echo "##################################################################"
    echo "##################################################################"
    echo ""
}
function fError_check()
{
    return 0
}
##################################################################
##################################################################
####    Functions
##################################################################
##################################################################
function fInfo()
{
    printf "##################################################################\n"
    printf "####    Info\n"
    printf "##################################################################\n"
    printf "####    %s\t: %s\n" "REPO" "${CONFIG_DOCKER_REPO}"
    printf "####    %s\t: %s\n" "TAG" "${CONFIG_DOCKER_TAG}"
    printf "####    %s\t: %s\n" "USER" "${CONFIG_DOCKER_USER}"
    printf "##################################################################\n"

}
function fBuild()
{
    fPrint_title "Build"
    echo "docker build --file ${CONFIG_DOCKER_FILE} --tag ${CONFIG_DOCKER_REPO}:${CONFIG_DOCKER_TAG} ."
    # docker build --file ${CONFIG_DOCKER_FILE} --tag "${CONFIG_DOCKER_REPO}:${CONFIG_DOCKER_TAG}" .
    docker build --file ${CONFIG_DOCKER_FILE} -t "${CONFIG_DOCKER_REPO}:${CONFIG_DOCKER_TAG}" .
}
function fRun()
{
    fPrint_title "Run"
    local var_addictional_cmd=()
    if [ -n "${VAR_HOST_PASTHROUGH_PATH}" ]
    then
        var_addictional_cmd+=("-v ${VAR_HOST_PASTHROUGH_PATH}:${VAR_CONTAINER_PASTHROUGH_PATH}")
    fi
    # --rm                             Automatically remove the container when it exits
    echo docker run -it ${var_addictional_cmd[@]} --rm -u ${CONFIG_DOCKER_USER} ${CONFIG_DOCKER_REPO}:${CONFIG_DOCKER_TAG}
    docker run -it ${var_addictional_cmd[@]} --rm -u ${CONFIG_DOCKER_USER} ${CONFIG_DOCKER_REPO}:${CONFIG_DOCKER_TAG}
}
function fCommit()
{
    fPrint_title "Commit"
    local var_container_instance="${1}"
    # docker commit c3f279d17e0a  svendowideit/testimage:version3
    # docker commit ${var_container_instance} ${CONFIG_DOCKER_REPO}:${CONFIG_DOCKER_TAG}
    echo docker commit ${var_container_instance} ${CONFIG_DOCKER_REPO}:${CONFIG_DOCKER_TAG}

}
function fRemove()
{
    fPrint_title "Remove"
    local var_imgid=$(docker image ls | grep ${CONFIG_DOCKER_REPO} | grep ${CONFIG_DOCKER_TAG} | cut -d " " -f 20-24)
    if [ "${var_imgid}" != "" ]
    then
        echo "docker image rm ${var_imgid}"
        eval "docker image rm ${var_imgid}"
    fi
}
function fHelp()
{
    printf "Script\n"
    printf "[Options]\n"
    printf "    %s\t %s\n" "-b|--build|build" "build test docker"
    printf "    %s\t %s\n" "-r|--run|run" "run test docker"
    printf "    %s\t %s\n" "-c|--commit|commit" "commit container changes, ex. -c [container id]"
    printf "    %s\t %s\n" "--remove" "remove test docker"

    printf "    %s\t %s\n" "-d|--disk|disk" "pass folder as disk on container"
    printf "[Others]\n"
    printf "    %s\t %s\n" "-h|--help"  "print help info, for docker help, do docker run --help"
    return 0
}

function fMain()
{
    fPrint_title "Docker Env Setup"
    local flag_build="n"
    local flag_run="n"
    local flag_rm="n"
    local flag_commit="n"

    local var_container_instance=""


    while [[ ${#} > 0 ]]
    do
        case ${1} in
            -b|--build|build)
                flag_build=y
                ;;
            -r|--run|run)
                flag_run=y
                ;;
            -c|--commit|commit)
                flag_commit=y
                var_container_instance=$2
                shift 1
                ;;
            -d|--disk)
                tmp_path=$2
                if [ -d "${tmp_path}" ]
                then
                    VAR_HOST_PASTHROUGH_PATH=$(realpath ${tmp_path})
                fi
                shift 1
                ;;
            --remove|remove)
                flag_rm=y
                ;;
            -h|--help)
                fHelp
                exit 0
                ;;
            *)
                echo "Unknown Args"
                fHelp
                exit 1
                ;;
        esac
        shift 1
    done

    fInfo

    if [ "${flag_build}" = "y" ]
    then
        fBuild
    fi
    if [ "${flag_run}" = "y" ]
    then
        fRun
    fi
    if [ "${flag_rm}" = "y" ]
    then
        fRemove
    fi
    if [ "${flag_commit}" = "y" ]
    then
        fCommit ${var_container_instance}
    fi
}
fMain $@
