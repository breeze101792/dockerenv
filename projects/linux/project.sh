#!/bin/bash
printf "##################################################################\n"
printf "##  Linux Project Environment Setup\n"
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
function fLinux()
{
    printf "##################################################################\n"
    printf "## Linux Setup\n"
    printf "##################################################################\n"
    apt-get install -y git fakeroot build-essential ncurses-dev xz-utils libssl-dev bc flex libelf-dev bison
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
    echo "Linux setup"
    while [[ ${#} > 0 ]]
    do
        case ${1} in
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
    fLinux
    fFinalize
}
fMain $@