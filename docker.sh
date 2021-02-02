#!/bin/bash
##################################################################
####    Build config
##################################################################
CONFIG_DOCKER_FILE="Dockerfile"
CONFIG_DOCKER_REPO="test"
CONFIG_DOCKER_TAG="0.1"
CONFIG_DOCKER_USER="docker"
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
    docker run -it --rm -u ${CONFIG_DOCKER_USER} ${CONFIG_DOCKER_REPO}:${CONFIG_DOCKER_TAG}
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
    printf "[Others]\n"
    printf "    %s\t %s\n" "-h|--help"  "print help info"
    return 0
}

function fMain()
{
    fPrint_title "Docker Env Setup"
    local flag_build=n
    local flag_run=n
    local flag_rm=n
    while [[ ${#} > 0 ]]
    do
        case ${1} in
            -b|--build|build)
                flag_build=y
                ;;
            -r|--run|run)
                flag_run=y
                ;;
            --remove)
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
}
fMain $@
