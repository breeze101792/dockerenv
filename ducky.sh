#!/bin/bash
##################################################################
####    Def Variables
##################################################################

##################################################################
####    Path Variables
##################################################################
if [ -n "${BASH_SOURCE}" ] && [ -f "$(dirname ${BASH_SOURCE[0]})/ducky.sh" ] 
then
    # bash
    tmp_script_dir="$(dirname ${BASH_SOURCE[0]})"
    VAR_ROOT_PATH="$(realpath ${tmp_script_dir})"
else
    VAR_ROOT_PATH="$(realpath ${PWD})"
fi

# path config
VAR_TOOLS_PATH="${VAR_ROOT_PATH}/tools"
VAR_BUILD_PATH="${VAR_ROOT_PATH}/build"
VAR_PROJECT_PATH="${VAR_ROOT_PATH}/projects"
VAR_PROJECT_NAME="default"

# run config
VAR_WORKPROJECT_PATH="${PWD}"

# helper projects
VAR_HELPER_SUPPORT_PROJECTS=()

# build config
VAR_BUILD_DEF_DOCKER_FILE="${VAR_BUILD_PATH}/Dockerfile"

##################################################################
####    Docker file Variables
##################################################################

##    Version config
DOCKER_CONFIG_DOCKER_REPO="devlab"
DOCKER_CONFIG_DOCKER_TAG="1.0"

##    Var config
DOCKER_VAR_BASE_DISTRO="ubuntu"
DOCKER_VAR_BASE_IMAGE="ubuntu"
DOCKER_VAR_BASE_IMAGE_TAG="18.04"

DOCKER_VAR_MAINTAINER="breeze101792@gmail.com"
DOCKER_VAR_USER_NAME="docker"
DOCKER_VAR_USER_PASS="123456"
##################################################################
####    Runtime Variables
##################################################################
VAR_WORKDIRP_PATH="/workdir"

##################################################################
##################################################################
####    Base Functions
##################################################################
##################################################################
function fPrint_title()
{
    echo "##################################################################"
    echo "####    $@"
    echo "##################################################################"
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
    printf "####    %- 12s\t: %s\n" "ROOT PATH" "${VAR_ROOT_PATH}"
    printf "####    %- 12s\t: %s\n" "REPO" "${DOCKER_CONFIG_DOCKER_REPO}"
    printf "####    %- 12s\t: %s\n" "TAG" "${DOCKER_CONFIG_DOCKER_TAG}"
    printf "####    %- 12s\t: %s\n" "USER" "${DOCKER_VAR_USER_NAME}"

    printf "####    %- 12s\t: %s\n" "Base Image" "${DOCKER_VAR_BASE_IMAGE}:${DOCKER_VAR_BASE_IMAGE_TAG}"
    printf "##################################################################\n"
}
####    Config
##################################################################
function fSetup_config()
{
    local var_proj_path=${VAR_PROJECT_PATH}/${VAR_PROJECT_NAME}
    if ! test -d "${var_proj_path}"; then
        echo "No project folder found. ${var_proj_path}"
        return -1
    fi

    if test -f "${var_proj_path}/profile.sh"; then
        source "${var_proj_path}/profile.sh"
    else
        echo "Profile not found."
    fi
}

####    Docker files generation
##################################################################
function fGen_buildfolder()
{
    local var_proj_path=${VAR_PROJECT_PATH}/${VAR_PROJECT_NAME}
    local var_tools_path="${VAR_BUILD_PATH}/tools"
    # create build folder
    if test -d ${VAR_BUILD_PATH}
    then
        rm -rf "${VAR_BUILD_PATH}"
    fi
    mkdir -p "${VAR_BUILD_PATH}"

    # create tools
    mkdir -p "${var_tools_path}/setup"
    cp -rf "${VAR_TOOLS_PATH}"/* "${var_tools_path}/setup/"

    # create project files
    cp -f "${var_proj_path}/"* "${var_tools_path}/"
    # cp -f "${var_proj_path}"/entrypoint.sh "${var_tools_path}"/
    # cp -f "${var_proj_path}"/bootstrap.sh "${var_tools_path}"/

    echo '[Checkpoint] Setup env'
}
function fGen_dockerfile()
{
    local var_docker_tools_path="/tools"
    local var_tools_path="build/tools"
    cat <<EOF > "${VAR_BUILD_DEF_DOCKER_FILE}"
## base image
FROM ${DOCKER_VAR_BASE_IMAGE}:${DOCKER_VAR_BASE_IMAGE_TAG}

## MAINTAINER
MAINTAINER ${DOCKER_VAR_MAINTAINER}
#######################################################
##    System settings
#######################################################
ADD ${var_tools_path} ${var_docker_tools_path}
# distro setup
RUN bash ${var_docker_tools_path}/setup/distro.sh --distro ${DOCKER_VAR_BASE_DISTRO}

# user setup
RUN bash ${var_docker_tools_path}/setup/setup.sh --account --user ${DOCKER_VAR_USER_NAME} --pass ${DOCKER_VAR_USER_PASS}

# Run project specify setup.
RUN bash ${var_docker_tools_path}/project.sh

# clean out setup folder
RUN rm -r ${var_docker_tools_path}/setup
RUN rm -r ${var_docker_tools_path}/profile.sh
RUN rm -r ${var_docker_tools_path}/project.sh

RUN chmod +x ${var_docker_tools_path}/entrypoint.sh

#######################################################
##    Finalize Docker Setting
#######################################################
USER ${DOCKER_VAR_USER_NAME}
ENTRYPOINT ${var_docker_tools_path}/entrypoint.sh
# WORKDIR /home/${DOCKER_VAR_USER_NAME}
WORKDIR /workdir
EOF
}
function fGenFiles()
{
    fPrint_title "Generate"
    echo "docker gen file ${VAR_BUILD_DEF_DOCKER_FILE} tag ${DOCKER_CONFIG_DOCKER_REPO}:${DOCKER_CONFIG_DOCKER_TAG} ."

    fGen_buildfolder
    fGen_dockerfile
}
####    Docker functions
##################################################################
function fGetImageID()
{
    local var_repo=$1
    local var_tag=$2

    local var_imgid=$(docker images | grep ${var_repo} | grep ${var_tag}  | tr -s ' ' | cut -d ' ' -f 3)
    if [ "${var_imgid}" != "" ]
    then
        echo ${var_imgid}
        return 0
    else
        return -1
    fi
}
function fBuild()
{
    fPrint_title "Build"
    echo "docker build --file ${VAR_BUILD_DEF_DOCKER_FILE} --tag ${DOCKER_CONFIG_DOCKER_REPO}:${DOCKER_CONFIG_DOCKER_TAG} ."

    # echo fGetImageID ${DOCKER_CONFIG_DOCKER_REPO} ${DOCKER_CONFIG_DOCKER_TAG}
    fGetImageID ${DOCKER_CONFIG_DOCKER_REPO} ${DOCKER_CONFIG_DOCKER_TAG}
    if [ "${?}" = "0" ]
    then
        echo "Image already found on docker image"
        exit -1
    fi

    echo "Start building Container"

    # docker build --file ${VAR_BUILD_DEF_DOCKER_FILE} --tag "${DOCKER_CONFIG_DOCKER_REPO}:${DOCKER_CONFIG_DOCKER_TAG}" .
    docker build --file ${VAR_BUILD_DEF_DOCKER_FILE} -t "${DOCKER_CONFIG_DOCKER_REPO}:${DOCKER_CONFIG_DOCKER_TAG}" .
}
function fRun()
{
    fPrint_title "Run"
    local var_addictional_cmd=()
    if [ -n "${VAR_WORKPROJECT_PATH}" ]
    then
        var_addictional_cmd+=("-v ${VAR_WORKPROJECT_PATH}:${VAR_WORKDIRP_PATH}")
    fi
    # connect x socket for launching gui program
    if test -n ${DISPLAY}
    then
        var_addictional_cmd+=("-e DISPLAY=$DISPLAY")
        var_addictional_cmd+=("-v /tmp/.X11-unix/:/tmp/.X11-unix/")
    fi
    # --rm                             Automatically remove the container when it exits
    echo docker run -it ${var_addictional_cmd[@]} --rm -u ${DOCKER_VAR_USER_NAME} ${DOCKER_CONFIG_DOCKER_REPO}:${DOCKER_CONFIG_DOCKER_TAG}
    docker run -it ${var_addictional_cmd[@]} -h ${DOCKER_CONFIG_DOCKER_REPO} --rm -u ${DOCKER_VAR_USER_NAME} ${DOCKER_CONFIG_DOCKER_REPO}:${DOCKER_CONFIG_DOCKER_TAG}
    # "docker run --cpus=13 -it --rm --name android_builder -v /mnt/projects/android:/home/docker/android -u docker android_builder:v1.0 /bin/bash"
}
function fCommit()
{
    fPrint_title "Commit"
    local var_container_instance="${1}"
    # docker commit c3f279d17e0a  svendowideit/testimage:version3
    # docker commit ${var_container_instance} ${DOCKER_CONFIG_DOCKER_REPO}:${DOCKER_CONFIG_DOCKER_TAG}
    echo docker commit ${var_container_instance} ${DOCKER_CONFIG_DOCKER_REPO}:${DOCKER_CONFIG_DOCKER_TAG}

}
function fRemove()
{
    fPrint_title "Remove"
    local var_imgid=$(docker images | grep ${DOCKER_CONFIG_DOCKER_REPO} | grep ${DOCKER_CONFIG_DOCKER_TAG}  | tr -s ' ' | cut -d ' ' -f 2)
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
function fUpdateTools()
{
    local var_src_tools=~/tools
    VAR_TOOLS_PATH="${VAR_ROOT_PATH}/tools"
    cp -f $var_src_tools//shellscripts/tools/hslite/hslite.sh ${VAR_TOOLS_PATH}/bashrc
    cp -f $var_src_tools/vim-ide/tools/vimlite.vim ${VAR_TOOLS_PATH}/vimrc
}
function fHelp()
{
    printf "Script\n"
    printf "[Options]\n"
    printf "    %- 32s\t %s\n" "-g|--gen|gen [proj]" "generate docker files"
    printf "    %- 32s\t %s\n" "-b|--build|build [proj]" "build test docker"
    printf "    %- 32s\t %s\n" "-r|--run|run [proj]" "run test docker"
    printf "    %- 32s\t %s\n" "-c|--commit|commit" "commit container changes, ex. -c [container id]"
    printf "    %- 32s\t %s\n" "-p|--prune|prune" "Clean system cached"
    printf "    %- 32s\t %s\n" "--remove|remove" "remove test docker"
    printf "    %- 32s\t %s\n" "--clean|clean" "remove none image"
    printf "    %- 32s\t %s\n" "--update-tools" "update tools on system"

    printf "[Runtime Config]\n"
    printf "    %- 32s\t %s\n" "-w|--workdir|workdir" "pass folder as workdir on container"
    printf "[Shortcuts]\n"
    printf "    %- 32s\t %s\n" "ls" "list all images"
    printf "[Environment]\n"
    printf "    %- 32s\t %s\n" "[project name]" "set project context"
    printf "    %- 32s\t %s\n" "env: ${VAR_HELPER_SUPPORT_PROJECTS[*]}" "Supported projects"
    printf "[Others]\n"
    printf "    %- 32s\t %s\n" "-h|--help"  "print help info, for docker help, do docker run --help"
    printf "[Note.]\n"
    printf "    %- 32s\t %s\n" "Build android env" "ducky.sh android -b"
    printf "    %- 32s\t %s\n" "Running android env" "ducky.sh android -r"
    printf "    %- 32s\t %s\n" "Binding storage to another folder" "sudo mount --rbind /mnt/docker /var/lib/docker"
    fHelp_Docker
    return 0
}
function fHelp_Docker()
{
    printf "[Docker Original Commands]\n"
    printf "    %- 32s\t %s\n" "Rename Image" "docker image tag server:latest myname/server:latest"
    printf "    %- 32s\t %s\n" "Search offical Image" "docker search ubuntu -f is-official=true"
    return 0
}
function fMain()
{
    fPrint_title "Docker Env Setup"
    local flag_gen="n"
    local flag_build="n"
    local flag_run="n"
    local flag_rm="n"
    local flag_commit="n"
    local flag_clean="n"
    local flag_prune="n"

    local var_container_instance=""

    VAR_HELPER_SUPPORT_PROJECTS+=("linux" "fpga" "arch" "android")
    while [[ ${#} > 0 ]]
    do
        case ${1} in
            --update-tools)
                fUpdateTools
                ;;
            -g|--gen|gen)
                flag_gen=y
                for proj in "${VAR_HELPER_SUPPORT_PROJECTS[@]}"; do
                    if [[ "${2}" == "${proj}" ]]; then VAR_PROJECT_NAME="${2}"; shift 1; break; fi
                done
                ;;
            -b|--build|build)
                flag_build=y
                for proj in "${VAR_HELPER_SUPPORT_PROJECTS[@]}"; do
                    if [[ "${2}" == "${proj}" ]]; then 
                        VAR_PROJECT_NAME="${2}";
                        flag_gen=y
                        shift 1; 
                        break;
                    fi
                done
                ;;
            -r|--run|run)
                flag_run=y
                for proj in "${VAR_HELPER_SUPPORT_PROJECTS[@]}"; do
                    if [[ "${2}" == "${proj}" ]]; then VAR_PROJECT_NAME="${2}"; shift 1; break; fi
                done
                ;;
            -p|--prune|prune)
                flag_prune="y"
                ;;
            -c|--commit|commit)
                flag_commit=y
                var_container_instance=$2
                shift 1
                ;;
            --remove|remove)
                flag_rm=y
                ;;
            --clean|clean)
                flag_clean=y
                ;;
            ## Build configs
            ## Runtime Options
            -w|--workdir|workdir)
                tmp_path=$2
                if [ -d "${tmp_path}" ]
                then
                    VAR_WORKPROJECT_PATH=$(realpath ${tmp_path})
                fi
                shift 1
                ;;
            ## Shortcuts
            ls)
                docker images
                return 0
                ;;
            -h|--help)
                fHelp
                exit 0
                ;;
            *)
                local is_project="n"
                for proj in "${VAR_HELPER_SUPPORT_PROJECTS[@]}"; do
                    if [[ "${1}" == "${proj}" ]]; then
                        VAR_PROJECT_NAME="${1}"
                        is_project="y"
                        break
                    fi
                done

                if [ "${is_project}" == "n" ]; then
                    echo "Unknown Args: $@"
                    fHelp
                    exit 1
                fi
                ;;
        esac
        shift 1
    done
    pushd ${VAR_ROOT_PATH}

    # setup config variables
    fSetup_config

    fInfo

    if [ "${flag_commit}" = "y" ]
    then
        fCommit ${var_container_instance}
    fi

    if [ "${flag_prune}" = "y" ]
    then
        docker system prune -a
    fi
    if [ "${flag_clean}" = "y" ]
    then
        fClean
    fi
    if [ "${flag_rm}" = "y" ]
    then
        fRemove
    fi

    if [ "${flag_gen}" = "y" ]
    then
        fGenFiles
    fi
    if [ "${flag_build}" = "y" ]
    then
        fBuild
    fi
    if [ "${flag_run}" = "y" ]
    then
        fRun
    fi
    popd
}
fMain $@
