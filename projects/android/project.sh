#!/bin/bash
printf "##################################################################\n"
printf "##  Android Project Environment Setup\n"
printf "##################################################################\n"
function fPrepare()
{
    printf "##################################################################\n"
    printf "## Prepare Setup\n"
    printf "##################################################################\n"

    apt-get update
}
function fAndroid()
{
    printf "##################################################################\n"
    printf "## Android AOSP Setup\n"
    printf "##################################################################\n"

    ## Android Require Package
    apt-get install -y git-core gnupg flex bison build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z1-dev libgl1-mesa-dev libxml2-utils xsltproc unzip fontconfig
}
function fLineageos()
{
    printf "##################################################################\n"
    printf "## LineageOS Setup\n"
    printf "##################################################################\n"

    ## Lineageos Require Package
    apt-get install -y bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5 libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev
    apt-get install -y libwxgtk3.0-dev
}
function fHelp()
{
    printf "Android Project Env\n"
    printf "[Options]\n"
    printf "    %s\t %s\n" "-h|--help"  "print help info, for docker help, do docker run --help"
    return 0
}
function fMain()
{
    echo "Android setup"
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
    fAndroid
    fLineageos
}
fMain $@