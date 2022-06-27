#!/bin/bash
##################################################################
####    Build config
##################################################################
VAR_DEF_DOCKER_FILE="Dockerfile"
CONFIG_DOCKER_REPO="devlab"
CONFIG_DOCKER_TAG="1.0"
CONFIG_DOCKER_USER="docker"
##################################################################
####    Variables
##################################################################
VAR_ROOT_PATH="${PWD}"
VAR_TOOLS_PATH="${VAR_ROOT_PATH}/tools"
VAR_BUILD_PATH="${VAR_ROOT_PATH}/build"

VAR_DEF_DOCKER_FILE="${VAR_ROOT_PATH}/Dockerfile"
VAR_EXPERIMENT_SCRIPT="${VAR_ROOT_PATH}/experiment/default.sh"
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
    echo "docker build --file ${VAR_DEF_DOCKER_FILE} --tag ${CONFIG_DOCKER_REPO}:${CONFIG_DOCKER_TAG} ."

    # env setup
    if test -d ${VAR_BUILD_PATH}
    then
        rm -rf "${VAR_BUILD_PATH}"
    fi
    mkdir -p "${VAR_BUILD_PATH}"
    cp -rf "${VAR_TOOLS_PATH}"/* "${VAR_BUILD_PATH}/"
    cp -f "${VAR_EXPERIMENT_SCRIPT}" "${VAR_BUILD_PATH}/experiment.sh"
    echo '[Checkpoint] Setup env'

    # docker build --file ${VAR_DEF_DOCKER_FILE} --tag "${CONFIG_DOCKER_REPO}:${CONFIG_DOCKER_TAG}" .
    docker build --file ${VAR_DEF_DOCKER_FILE} -t "${CONFIG_DOCKER_REPO}:${CONFIG_DOCKER_TAG}" .
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
    local var_imgid=$(docker images | grep ${CONFIG_DOCKER_REPO} | grep ${CONFIG_DOCKER_TAG}  | tr -s ' ' | cut -d ' ' -f 3)
    if [ "${var_imgid}" != "" ]
    then
        echo "docker image rm ${var_imgid}"
        eval "docker image rm ${var_imgid}"
        eval "docker images"
    fi
}
function fClean()
{
    fPrint_title "Clean none image"
    for each_imeage in $(docker images | grep "none.*none" | tr -s ' ' | cut -d ' ' -f 3)
    do
        echo "Remove ${each_imeage}"
        docker image remove ${each_imeage}
    done

}
function fHelp()
{
    printf "Script\n"
    printf "[Options]\n"
    printf "    %s\t %s\n" "-b|--build|build" "build test docker"
    printf "    %s\t %s\n" "-r|--run|run" "run test docker"
    printf "    %s\t %s\n" "-c|--commit|commit" "commit container changes, ex. -c [container id]"
    printf "    %s\t %s\n" "-p|--prune|prune" "Clean system caced"
    printf "    %s\t %s\n" "--remove|remove" "remove test docker"
    printf "    %s\t %s\n" "--clean|clean" "remove none image"
    printf "    %s\t %s\n" "-e|--experiment|exp" "remove test docker"

    printf "    %s\t %s\n" "-d|--disk|disk" "pass folder as disk on container"
    printf "[Shortcuts]\n"
    printf "    %s\t %s\n" "ls" "list all images"
    printf "[Environment]\n"
    printf "    %s\t %s\n" "--android|android|an" "Config for android build env"
    printf "    %s\t %s\n" "--linux|linux" "Config for linux build env"
    printf "[Others]\n"
    printf "    %s\t %s\n" "-h|--help"  "print help info, for docker help, do docker run --help"
    printf "[Example]\n"
    printf "    %s\t %s\n" "Build android env" "docker.sh android -b"
    printf "    %s\t %s\n" "Running android env" "docker.sh android -r"
    fHelp_Docker
    return 0
}
function fHelp_Docker()
{
    printf "[Docker Original Commands]\n"
    printf "    %s\t %s\n" "Rename Image" "docker image tag server:latest myname/server:latest"
    return 0
}
function fMain()
{
    fPrint_title "Docker Env Setup"
    local flag_build="n"
    local flag_run="n"
    local flag_rm="n"
    local flag_commit="n"
    local flag_clean="n"
    local flag_prune="n"

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
            -p|--prune|prune)
                flag_prune="y"
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
            --clean|clean)
                flag_clean=y
                ;;
            -e|--experiment|exp)
                if [ -f "${VAR_EXPERIMENT_SCRIPT}" ]
                then
                    VAR_EXPERIMENT_SCRIPT="${2}"
                else
                    echo "Can't found experiment script"
                    return 1
                fi
                shift 1
                ;;
            ls)
                docker images
                return 0
                ;;
            --android|android|an)
                CONFIG_DOCKER_REPO="android"
                CONFIG_DOCKER_TAG="1.0"
                VAR_EXPERIMENT_SCRIPT="${VAR_ROOT_PATH}/experiment/android.sh"
                ;;
            --linux|linux)
                CONFIG_DOCKER_REPO="linux"
                CONFIG_DOCKER_TAG="1.0"
                VAR_EXPERIMENT_SCRIPT="${VAR_ROOT_PATH}/experiment/linux.sh"
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

    if [ "${flag_prune}" = "y" ]
    then
        docker system prune -a
    fi
    if [ "${flag_clean}" = "y" ]
    then
        fClean
    fi

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
