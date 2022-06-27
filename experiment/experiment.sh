#!/bin/bash
printf "##################################################################\n"
printf "##  Default Experiment Environment Setup"
printf "##################################################################\n"
function fLinuxInfo()
{
    echo Linux: $(uname -a)
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

    if [ "${flag_info}" = "y" ]
    then
        fLinuxInfo
    fi
}
fMain $@
