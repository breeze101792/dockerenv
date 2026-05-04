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
function fDefault()
{
    printf "##################################################################\n"
    printf "## Default Setup\n"
    printf "##################################################################\n"
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
    return 0
    fPrepare
    if [ "${flag_info}" = "y" ]
    then
        fDefault
    fi
    fFinalize
}

fMain $@
