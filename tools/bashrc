#!/bin/env shell
################################################################
####    Note.
################################################################
# NOTE.
# if useing sh, you there will no things like bashrc, but you
# could add the following line to automatically source shrc.
# export ENV="$HOME/.shrc"

if false; then
    # Please export things like the follings
    # FIXME, "~" may not suitable for all system. use absolute path instead.
    export HSL_SHELL=zsh
    # export HSL_ROOT_PATH="~/tools/hslite"
    export HSL_ROOT_PATH="/home/$(whoami)/tools/hslite"
    export HSL_LOCAL_VAR="${HSL_ROOT_PATH}/.var"
    source "${HSL_ROOT_PATH}/scripts/hslite.sh"
fi
################################################################
####    Auto Env
################################################################

## Flags
#===============================================================
[ -z ${HSL_FLAG_INITED} ] && export HSL_FLAG_INITED=false
[ -z ${HSL_FLAG_DEBUG} ] && export HSL_FLAG_DEBUG=false
[ -z ${HSL_FLAG_MOTD} ] && export HSL_FLAG_MOTD=false
[ -z ${HSL_FLAG_LANG} ] && export HSL_FLAG_LANG=false

## Path
#===============================================================
[ -z ${HOME} ] && test -d ~ && export HOME="~"
[ -z ${HOME} ] && export HOME=/

# Root path
[ -z ${HSL_ROOT_PATH} ] && test -d ${HOME}/tools/hslite && export HSL_ROOT_PATH="${HOME}/tools/hslite"
[ -z ${HSL_ROOT_PATH} ] && test -f ${HOME}/tools/hslite.sh && export HSL_ROOT_PATH="${HOME}/tools"
[ -z ${HSL_ROOT_PATH} ] && test -f ${HOME}/tools/scripts/hslite.sh && export HSL_ROOT_PATH="${HOME}/tools"
[ -z ${HSL_ROOT_PATH} ] && test -d ${HOME} && export HSL_ROOT_PATH="${HOME}"

# Congis path
[ -z ${HSL_CONFIG_PATH} ] && test -d ${HSL_ROOT_PATH}/configs && export HSL_CONFIG_PATH="${HSL_ROOT_PATH}/configs"

# Work path
[ -z ${HSL_WORK_PATH} ] && test -f ${HSL_ROOT_PATH}/work/work.sh && export HSL_WORK_PATH="${HSL_ROOT_PATH}/work"
[ -z ${HSL_WORK_PATH} ] && test -f ${HSL_ROOT_PATH}/scripts/work.sh && export HSL_WORK_PATH="${HSL_ROOT_PATH}/scripts"

# Local path
[ -z ${HSL_LOCAL_VAR} ] && export HSL_LOCAL_VAR="${HSL_ROOT_PATH}/.var"

## Shell env
#===============================================================
if [ -z ${HSL_SHELL} ] && [ -n ${SHELL} ] ; then
    if [ "${SHELL##*/}" = "bash" ] || [ "${SHELL}" = "/bin/bash" ] ; then
        export HSL_SHELL="bash"
    elif [ "${SHELL##*/}" = "zsh" ] ||  [ "${SHELL}" = "/bin/zsh" ] ; then
        export HSL_SHELL="zsh"
    elif [ "${SHELL##*/}" = "ash" ] ||  [ "${SHELL}" = "/bin/ash" ] ; then
        export HSL_SHELL="ash"
    else
        export HSL_SHELL="sh"
    fi
fi

################################################################
####    Settings
################################################################

####    Init
#===============================================================
# FIXME, refactor it
# export HSL_LOCAL_VAR="${HSL_ROOT_PATH}/.var"
# It's for bash
if [ ${HSL_SHELL} = "bash" ] || [ ${HSL_SHELL} = "sh" ] || [ ${HSL_SHELL} = "ash" ]
then
    # echo "Shell : ${HSL_SHELL}"
    # Use GNU ls colors when tab-completing files
    set colored-stats on

    # Disable history function
    # set +o history

    # check the window size after each command and, if necessary,
    # update the values of LINES and COLUMNS.
    shopt -s checkwinsize
    export PS1="[\u@\h][\d \A][\w]\\$ "
elif [ ${HSL_SHELL} = "zsh" ]
then
    # echo "Shell : ${HSL_SHELL}"
    PROMPT="[%n@%m][%D %T][%?][%d] $ "
else
    echo "Shell : ${HSL_SHELL}"
fi

#Enable vi mode, for key compatiable.
# User vi mode will not do auto-complete on sh.
# set -o vi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# Overridge lang settings
if [ ${HSL_FLAG_LANG} = true ]
then
    export LANG=en_US.UTF-8
    export LANGUAGE=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
fi

####    Path init
#===============================================================
test -n ${HSL_LOCAL_VAR} && (test -d ${HSL_LOCAL_VAR} || mkdir -p ${HSL_LOCAL_VAR})

####    Alias
#===============================================================
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

if test -f "${HSL_CONFIG_PATH}/config_legacy.kdl" && command -v zellij 2>&1 > /dev/null; then
    alias zellij="zellij -c ${HSL_CONFIG_PATH}/config_legacy.kdl"
fi
if test -f "${HSL_CONFIG_PATH}/tmux.conf" && command -v tmux 2>&1 > /dev/null; then
    alias tmux="tmux -f ${HSL_CONFIG_PATH}/tmux.conf"
fi

####    Post Setting
#===============================================================
# Local script
if test -n "${HSL_ROOT_PATH}"
then
    if test -f "${HSL_ROOT_PATH}/hsllocal.sh"
    then
        source ${HSL_ROOT_PATH}/hsllocal.sh
        #     echo "Local script ${HSL_ROOT_PATH}/hsllocal.sh"
        # else
        #     echo "Local script not found. ${HSL_ROOT_PATH}/hsllocal.sh"
    fi
fi

# work
if test -n "${HSL_WORK_PATH}"
then
    if test -f "${HSL_WORK_PATH}/work.sh"
    then
        source ${HSL_WORK_PATH}/work.sh
        #     echo "Work script ${HSL_WORK_PATH}/work.sh"
        # else
        #     echo "Work script not found. ${HSL_WORK_PATH}/work.sh"
    fi
fi

if test -n "${HSL_ROOT_PATH}"
then
    # if test -d "${HSL_ROOT_PATH}/scripts"
    # then
    #     export PATH=${PATH}:"${HSL_ROOT_PATH}/scripts"
    #     # else
    #     #     echo "Execute script folder not found. ${HSL_ROOT_PATH}/scripts.sh"
    # fi

    if test -d "${HSL_ROOT_PATH}/bin"
    then
        export PATH=${PATH}:"${HSL_ROOT_PATH}/bin"
        # else
        #     echo "Binary folder not found. ${HSL_ROOT_PATH}"
    fi
fi

if test -d "~/.usr/bin"
then
    export PATH=${PATH}:"~/.usr/bin"
fi

# Homebrew test
if test -f "/opt/homebrew/bin/brew"
then
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi
################################################################
####    Finalize
################################################################

if [ ${HSL_FLAG_MOTD} = true ] && [ ${HSL_FLAG_INITED} = true ]
then
    printf " %s\n" ""
    printf " %s\n" " _   _ ____        _     ___ _____ _____ "
    printf " %s\n" "| | | / ___|      | |   |_ _|_   _| ____|"
    printf " %s\n" "| |_| \___ \ _____| |    | |  | | |  _|  "
    printf " %s\n" "|  _  |___) |_____| |___ | |  | | | |___ "
    printf " %s\n" "|_| |_|____/      |_____|___| |_| |_____|"
    printf " %s\n" ""

    test -n "${SSH_CONNECTION}" && printf "Connections: %s\n" "${SSH_CONNECTION}"

    ## Debug
    if [ ${HSL_FLAG_DEBUG} = true ]
    then
        echo "HSL Debug Info"
        echo "HSL_ROOT_PATH: ${HSL_ROOT_PATH}" 
        echo "HSL_WORK_PATH: ${HSL_WORK_PATH}" 
    fi
    export HSL_FLAG_MOTD=false
fi
echo -en "\033]0;$(hostname)\a"

export HSL_FLAG_INITED=true

################################################################
####    Build-In Function
################################################################
hsl_reload()
{
    local var_source_file=""

    if test -f "${HSL_ROOT_PATH}/scripts/hslite.sh"
    then
        source "${HSL_ROOT_PATH}/scripts/hslite.sh"
    elif [ ${HSL_SHELL} = "bash" ]
    then
        source ${HOME}/.bashrc
    elif [ ${HSL_SHELL} = "zsh" ]
    then
        source ${HOME}/.zshrc
    elif [ ${HSL_SHELL} = "sh" ]
    then
        source ${HOME}/.profile
    else
        echo "Unknow shtype. ${HSL_SHELL}"
        return
    fi
    echo "Hslite reloaded."
}
hsl_info()
{
    echo "## HSL INFO"
    echo "HSL_ROOT_PATH: ${HSL_ROOT_PATH}" 
    echo "HSL_WORK_PATH: ${HSL_WORK_PATH}" 
    echo "## Shell INFO"
    echo "HOME: ${HOME}" 
    echo "SHELL: ${SHELL}" 
    echo "ENV: ${ENV}" 
}
xim()
{
    ## Override commands
    if test -f "${HSL_CONFIG_PATH}/vimlite.vim"; then
        export MYVIMRC=${HSL_CONFIG_PATH}/vimlite.vim
        vim -u ${HSL_CONFIG_PATH}/vimlite.vim $@
        unset MYVIMRC
    else
        vim $@
    fi
}
session()
{
    local var_taget_socket=""
    local var_action=""
    local var_remove_list=()
    if command -v tmux 2>&1 > /dev/null; then
        local var_cmd='tmux'
    elif command -v zellij 2>&1 > /dev/null; then
        local var_cmd='zellij'
    else
        echo "no tmux or zellij found."
    fi
    local var_cmd_opts=('')

    local var_taget_name=""

    while [[ "$#" != 0 ]]
    do
        case $1 in
            -ls|--list|ls)
                var_action="list"
                ;;
            -S|--socket)
                if [ "${var_cmd}" = "tmux"  ] ; then
                    var_cmd_opts+=("-S ${2}")
                fi
                shift 1
                ;;
            -f|--file)
                if test -f ${2}
                then
                    if [ "${var_cmd}" = "tmux"  ] ; then
                        var_cmd_opts+=("-f ${2}")
                    elif [ "${var_cmd}" = "zellij"  ] ; then
                        var_cmd_opts+=("-c ${2}")
                    fi
                else
                    echo "Config file not found. $2"
                    return 1
                fi
                shift 1
                ;;
            -s|--session-name)
                tmp_session_name="${2}"

                local tmp_name=$(session ls |grep "${tmp_session_name}" | cut -d ' ' -f 1| sed 's/:$//g' | tr -d  ' ')
                if [ "${tmp_name}" != "" ]
                then
                    var_action="attach"
                    var_taget_name=${tmp_name}
                else
                    var_action="create"
                    var_taget_name=${tmp_session_name}
                fi
                shift 1
                ;;
            --host|host|hostname|h)
                local var_hostname=""
                if command -v hostname 2>&1 > /dev/null
                then
                    var_hostname="$(hostname)"
                elif test -f "/etc/hostname"
                then
                    var_hostname="$(cat /etc/hostname)"
                fi

                local tmp_name=$(session ls |grep --color=none "${var_hostname}" | cut -d ' ' -f 1| sed 's/:$//g' | tr -d  ' ')
                if [ "${tmp_name}" != "" ]
                then
                    var_action="attach"
                    var_taget_name=${tmp_name}
                else
                    var_action="create"
                    var_taget_name=${var_hostname}
                fi
                ;;
            -o|--options)
                var_cmd_opts+=($*)
                ;;
            -h|--help)
                echo "session " "session lite is an independ instance of ${var_cmd}"
                echo "SYNOPSIS"
                echo "session [Options] [Value]"
                echo "Options"
                echo "    -f|--file"              -d "Specify config file"
                echo "    -S|--socket"            -d "Specify socket file"
                echo "    --host|host|hostname|h" -d "detach all session"
                echo "    -ls|--list|ls|list"     -d "List sessions"
                echo "    -s|--session"           -d "specify session name"
                echo "    -o|--options"           -d "specify command options"
                return 0
                ;;
            *)
                tmp_session_name="${*}"

                local tmp_name=$(session ls |grep "${tmp_session_name}" | cut -d ' ' -f 1| sed 's/:$//g' | tr -d  ' ')
                if [ "${tmp_name}" != "" ]
                then
                    var_action="attach"
                    var_taget_name=${tmp_name}
                else
                    var_action="create"
                    var_taget_name=${tmp_session_name}
                fi
                break
                ;;
        esac
        shift 1
    done

    if [ "${var_action}" = "attach" ]
    then
        echo "[${var_action}]Session Name: '${var_taget_name}'"
        if [ "${var_cmd}" = "tmux"  ] ; then
            var_cmd_opts+=("attach -t ${var_taget_name}")
        elif [ "${var_cmd}" = "zellij"  ] ; then
            var_cmd_opts+=("-s ${var_taget_name} attach")
        fi
    elif [ "${var_action}" = "create" ]
    then
        echo "[${var_action}]Session Name: '${var_taget_name}'"
        if [ "${var_cmd}" = "tmux"  ] ; then
            var_cmd_opts+=("-u -2 new -s ${var_taget_name}")
        elif [ "${var_cmd}" = "zellij" ] ; then
            var_cmd_opts+=("-s ${var_taget_name}")
        fi
    elif [ "${var_action}" = "list" ]
    then
        echo "List sessions:"
        var_cmd_opts+=("ls")
        # if [ "${var_cmd}" = "tmux"  ] ; then
        #     var_cmd_opts+=("ls")
        # elif [ "${var_cmd}" = "zellij" ] ; then
        #     var_cmd_opts+=("ls")
        # fi
    fi

    echo "export TERM='xterm-256color' && ${var_cmd} ${var_cmd_opts[@]}"
    eval "export TERM='xterm-256color' && ${var_cmd} ${var_cmd_opts[@]}"
}
fm()
{
    local var_fm="filemanager --cache-path ${HSL_LOCAL_VAR}/hsfm"

    eval ${var_fm} $@

    local tmp_path=$(eval "${var_fm} -l flush")
    if test -d "${tmp_path}"
    then
        echo goto path:${tmp_path}
        cd "${tmp_path}"
    fi
}

################################################################
################################################################
####    Sync Function
################################################################
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
    # FIXME, do not use realpath.
    local target_path=""
    if ! test -d "${1}"; then
        echo "${1} not found."
        return -1
    else
        pushd $1 2>&1 > /dev/null
        target_path=$(pwd)
        popd 2>&1 > /dev/null
    fi

    if echo ${PATH} | grep -q ${target_path} 2>&1 > /dev/null
    then
        [ "${flag_verbose}" = "y" ] && echo "${target_path} has alread in your PATH";
        return 1
    else
        [ "${flag_verbose}" = "y" ] && echo -E "export PATH=${target_path}:"'$PATH;'
        export PATH=${target_path}:$PATH;
        return 0
    fi;

}
retitle()
{
    # print -Pn "\e]0;$@\a"
    echo -en "\033]0;$@\a"
}
toollink()
{
    local var_toolbox="busybox"
    local var_list_cmd="busybox | grep 'Currently defined functions' -A 1000 | sed 's/,//g' | sed '1d'"
    local flag_link_all="n"
    local var_white_list=()
    local var_output_path=${PWD}/toollink_${var_toolbox}
    # var_white_list+=("ls")

    while [[ "$#" != 0 ]]
    do
        case $1 in
            -t|--toolbox)
                var_toolbox="$2"
                shift 1
                ;;
            -l|--list-cmd)
                var_list_cmd=$2
                shift 1
                ;;
            -a|--all)
                flag_link_all="y"
                ;;
            -w|--white-list)
                var_white_list="$2"
                shift 1
                ;;
            -h|--help)
                echo "toollink toollink function"
                echo "SYNOPSIS"
                echo "toollink [Options] [Value]"
                echo "Options"
                echo "-t|--toolbox\t Specify busybox/toybox, default toybox"
                echo "-l|--list-cmd\t List command to show all support commands."
                echo "-w|--white-list\t White listed program, default link command not exists in system."
                echo "-a|--all\t Link all command."
                echo "-h|--help\t Print help function "
                return 0
                ;;
            *)
                break
                ;;
        esac
        shift 1
    done
    var_output_path=toollink_${var_toolbox}
    test -d "${var_output_path}" || mkdir "${var_output_path}"

    for each_cmd in $(${var_list_cmd})
    do
        echo "Check command '${each_cmd}'"
        if [ "${each_cmd}" = '[' ] || [ "${each_cmd}" = '[[' ] || ( command -v ${each_cmd} && [ "${flag_link_all}" = "n" ] ) > /dev/null
        then
            for each_whited_listed_cmd in ${var_white_list}
            do
                if [ "${each_whited_listed_cmd}" = "${each_cmd}" ]
                then
                    echo "ln '${var_toolbox}' '${var_output_path}/${each_cmd}'"
                    ln "${var_toolbox}" "${var_output_path}/${each_cmd}"
                fi
            done
        else
            echo "ln '${var_toolbox}' '${var_output_path}/${each_cmd}'"
            ln "${var_toolbox}" "${var_output_path}/${each_cmd}"
        fi
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
