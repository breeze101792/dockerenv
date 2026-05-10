#!/bin/bash
VAR_WORKING_PATH="./"
VAR_SETUP_TITLE="linux"
printf "##################################################################\n"
printf "##  ${VAR_SETUP_TITLE} Project Environment Setup\n"
printf "##################################################################\n"
function fPrepare()
{
    printf "##################################################################\n"
    printf "## Prepare Setup\n"
    printf "##################################################################\n"
}
function fSetupUser()
{
    printf "##################################################################\n"
    printf "## Finalize Setup\n"
    printf "##################################################################\n"
}
function fLinux()
{
    printf "##################################################################\n"
    printf "## Linux Setup\n"
    printf "##################################################################\n"
    apt-get build-dep linux
    apt-get install -y git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison
}
function fInfo()
{
    printf "##################################################################\n"
    printf "## Info\n"
    printf "##################################################################\n"
}
function fHelp()
{
    printf "Linux Project Env\n"
    printf "[Options]\n"
    printf "    %s\t %s\n" "-h|--help"  "print help info, for docker help, do docker run --help"
    return 0
}
function fMain()
{
    echo "${VAR_SETUP_TITLE} setup"
    local flag_info=n
    local flag_prepare=n
    local flag_setup=n
    local flag_user_setup=n
    while [[ ${#} > 0 ]]
    do
        case ${1} in
            --info)
                flag_info=y
                ;;
            --prepare)
                flag_prepare=y
                ;;
            --setup)
                flag_setup=y
                ;;
            --user-setup)
                flag_user_setup=y
                ;;
            --working-path)
                VAR_WORKING_PATH=$2
                shift 1
                ;;
            -h|--help)
                fHelp
                exit 0
                ;;
            *)
                echo "Unsupported Args, ignore the reset actions ${@}"
                exit 0
                ;;
        esac
        shift 1
    done
    pushd ${VAR_WORKING_PATH}
    if [ "${flag_info}" = "y" ]
    then
        fInfo
    fi
    if [ "${flag_prepare}" = "y" ]
    then
        fPrepare
    fi
    if [ "${flag_setup}" = "y" ]
    then
        fLinux
    fi
    if [ "${flag_user_setup}" = "y" ]
    then
        fSetupUser
    fi
    popd
}
fMain $@