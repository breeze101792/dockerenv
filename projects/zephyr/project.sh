#!/bin/bash
printf "##################################################################\n"
printf "##  Default Experiment Environment Setup\n"
printf "##################################################################\n"
function fPrepare()
{
    printf "##################################################################\n"
    printf "## Prepare Setup\n"
    printf "##################################################################\n"
}
function fFinalize()
{
    printf "##################################################################\n"
    printf "## Finalize Setup\n"
    printf "##################################################################\n"
}
function fInfo()
{
    printf "##################################################################\n"
    printf "## Info\n"
    printf "##################################################################\n"
}
function fGetDependency()
{
    printf "##################################################################\n"
    printf "## Get Dependency\n"
    printf "##################################################################\n"
    sudo apt install -y --no-install-recommends git cmake ninja-build gperf \
        ccache dfu-util device-tree-compiler wget python3 python3-dev python3-venv python3-tk \
        xz-utils file make gcc libsdl2-dev libmagic1

    if [ "$(uname -m)" = "x86_64" ]; then
        sudo apt install -y --no-install-recommends gcc-multilib g++-multilib
    fi
}
function fHelp()
{
    printf "Default Experiment Env\n"
    printf "[Options]\n"
    printf "    %s\t %s\n" "-h|--help"  "print help info, for docker help, do docker run --help"
    return 0
}
function fMain()
{
    echo "Default setup"
    local flag_info=n
    while [[ ${#} > 0 ]]
    do
        case ${1} in
            --info)
                flag_info=y
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
    fPrepare
    if [ "${flag_info}" = "y" ]
    then
        fInfo
    fi
    fGetDependency
    fFinalize
}

fMain $@
