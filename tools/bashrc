#!/bin/env shell
################################################################
####    Env
################################################################
[ -z ${HOME} ] && export HOME=/

[ -z ${HSL_SHELL} ] && export HSL_SHELL=sh
[ -z ${HSL_ROOT_PATH} ] && export HSL_ROOT_PATH=$(realpath ${HOME}/tools/hslite)
[ -z ${HSL_WORK_PATH} ] && export HSL_WORK_PATH=$(realpath ${HSL_ROOT_PATH})
################################################################
####    Settings
################################################################
# It's for bash
if [ ${HSL_SHELL} = "bash" ]
then
    # echo "Shell : ${HSL_SHELL}"
    # Use GNU ls colors when tab-completing files
    set colored-stats on

    # Disable history function
    set +o history

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize
    export PS1="[\u@\h][\d \A]\\$ "
elif [ ${HSL_SHELL} = "zsh" ]
then
    # echo "Shell : ${HSL_SHELL}"
    PROMPT="[%n@%m][%D %T][%?][%d] $ "
else
    echo "Shell : ${HSL_SHELL}"
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

################################################################
####    Alias
################################################################
alias l='ls -a '
alias lt='ls -a -t '
alias lc='ls -a --color=always'

alias ll='l -lh'
alias llc='ls -lh --color=always'
alias llt='ll -t'
alias lld='ll -al $@| grep "^d"'

alias cgrep='grep --color=always '
alias sgrep='grep -rnIi  '
alias scgrep='grep --color=always -rnIi  '

################################################################
####    Function
################################################################
epath()
{
    local flag_verbose=n
    if [[ $# == 0 ]]
    then
        echo "PATH=${PATH}"
        return 0
    fi
    #echo "Export Path $1";
    # if grep -q $1 <<<$PATH;
    local target_path=$(realpath $1)
    if echo ${PATH} | grep -q ${target_path}
    then
        [ "${flag_verbose}" = "y" ] && echo "${target_path} has alread in your PATH";
        return 1
    else
        [ "${flag_verbose}" = "y" ] && echo -E "export PATH=${target_path}:"'$PATH;'
        export PATH=${target_path}:$PATH;
        return 0
    fi;

}
balias()
{
    local var_toolbox="busybox"
     var_white_list=("ls")
    for each_cmd in $(${var_toolbox} | grep 'Currently defined functions' -A 1000 | sed 's/,//g' | sed '1d')
    do
        if [ "${each_cmd}" = '[' ] || [ "${each_cmd}" = '[[' ] || command -v ${each_cmd} > /dev/null
        then
            for each_whited_listed_cmd in ${var_white_list}
            do
                if [ "${each_whited_listed_cmd}" = "${each_cmd}" ]
                then
                    echo "alias |${each_cmd}|"
                    alias ${each_cmd}="${var_toolbox} ${each_cmd}"
                fi
            done
            continue
        fi
        echo "alias |${each_cmd}|"
        alias ${each_cmd}="${var_toolbox} ${each_cmd}"
    done
}
ffind()
{
    local flag_color="n"
    local pattern=""
    while [[ "$#" != 0 ]]
    do
        case $1 in
            -c|--color)
                flag_color="y"
                ;;
            -n|--no-color)
                flag_color="n"
                ;;
            -h|--help)
                printf "template template function"
                printf "SYNOPSIS"
                printf "template [Options] [Value]"
                printf "Options"
                printf "-c|--color\t Hilight keywords"
                printf "-n|--no-color\t Don't hilight keywords"
                printf "-h|--help\t Print help function "
                return 0
                ;;
            *)
                pattern="$@"
                break
                ;;
        esac
        shift 1
    done
    if [ "$flag_color" = "y" ]
    then
        find -L . -iname "*${pattern}*" | mark ${pattern}
    else
        find -L . -iname "*${pattern}*"
    fi

}
mark()
{
# Black        0;30     Dark Gray     1;30
# Red          0;31     Light Red     1;31
# Green        0;32     Light Green   1;32
# Brown/Orange 0;33     Yellow        1;33
# Blue         0;34     Light Blue    1;34
# Purple       0;35     Light Purple  1;35
# Cyan         0;36     Light Cyan    1;36
# Light Gray   0;37     White         1;37

# Color       #define       Value       RGB
# black     COLOR_BLACK       0     0, 0, 0
# red       COLOR_RED         1     max,0,0
# green     COLOR_GREEN       2     0,max,0
# yellow    COLOR_YELLOW      3     max,max,0
# blue      COLOR_BLUE        4     0,0,max
# magenta   COLOR_MAGENTA     5     max,0,max
# cyan      COLOR_CYAN        6     0,max,max
# white     COLOR_WHITE       7     max,max,max
    local color_array=(
        # $(echo -e "\033[0;30m")
        $(echo -e "\033[0;31m")
        $(echo -e "\033[0;32m")
        $(echo -e "\033[0;33m")
        $(echo -e "\033[0;34m")
        $(echo -e "\033[0;35m")
        $(echo -e "\033[0;36m")
        $(echo -e "\033[0;37m")
        $(echo -e "\033[1;30m")
        $(echo -e "\033[1;31m")
        $(echo -e "\033[1;32m")
        $(echo -e "\033[1;33m")
        $(echo -e "\033[1;34m")
        $(echo -e "\033[1;35m")
        $(echo -e "\033[1;36m")
        $(echo -e "\033[1;37m")
    )

    local clr_idx=1
    local hi_word=""
    local clr_code=""
    local ccstart=${color_array[1]}
    local ccend=$(echo -e "\033[0m")

    if [ "$1" = "-c" ] || [ "$1" = "-C" ] || [ "$1" = "--color" ]
    then
        clr_idx=$2
        shift 2
        hi_word=$*
        local ccstart=${color_array[$clr_idx]}
    elif [ "$1" = "-s" ] || [ "$1" = "-S" ] || [ "$1" = "--color-name" ]
    then
        local color_name=$2
        shift 2
        hi_word=$*
        case ${color_name} in
            red)
                ccstart=$(tput setaf 1)
                ;;
            green)
                ccstart=$(tput setaf 2)
                ;;
            yellow)
                ccstart=$(tput setaf 3)
                ;;
            blue)
                ccstart=$(tput setaf 4)
                ;;
            magenta)
                ccstart=$(tput setaf 5)
                ;;
            cyan)
                ccstart=$(tput setaf 6)
                ;;
            gray)
                ccstart=$(tput setaf 7)
                ;;
        esac
    else
        hi_word=$*
    fi
    # echo $ccred$hi_word$ccend
    # $@ 2>&1 | sed -E -e "s%${hi_word}%${color_array[$clr_idx]}&${ccend}%ig"
    sed -u -E -e "s%${hi_word}%${ccstart}&${ccend}%ig"
}
################################################################
####    Post Setting
################################################################

if test -f "${HSL_WORK_PATH}/work.sh"
then
    source ${HSL_WORK_PATH}/work.sh
#     echo "Work script ${HSL_WORK_PATH}/work.sh"
# else
#     echo "Work script not found. ${HSL_WORK_PATH}/work.sh"
fi

if test -d "${HSL_WORK_PATH}/scripts"
then
    epath "${HSL_WORK_PATH}/scripts"
# else
#     echo "Execute script folder not found. ${HSL_WORK_PATH}/scripts.sh"
fi

if test -d "${HSL_WORK_PATH}/bin"
then
    epath "${HSL_WORK_PATH}/bin"
# else
#     echo "Binary folder not found. ${HSL_WORK_PATH}"
fi
