#!/binash
##################################################################
####    config
##################################################################
CONFIG_USER_NAME="docker"
CONFIG_USER_PASSWD="123456"

CONFIG_TOOL_PATH="/tools"

##################################################################
####    Function
##################################################################
function fPrint_title()
{
    echo "##################################################################"
    echo "####    $@"
    echo "##################################################################"
    echo ""
}
function fUser_setup()
{
    fPrint_title "User Setup"
    local var_home_path="/home/${CONFIG_USER_NAME}"
    #######################################################
    ##    Setup System Env
    #######################################################
    ln -sf /usr/share/zoneinfo/Asia/Taipei /etc/localtime
    # use base as sh instead of dash
    ln -sf /bin/bash /bin/sh

    #######################################################
    ##    Accound settings
    #######################################################
    # Add user
    groupadd wheel
    useradd -G wheel -d ${var_home_path} -m ${CONFIG_USER_NAME}
    echo ${CONFIG_USER_NAME}:${CONFIG_USER_PASSWD} | chpasswd

    # setup sudo
    # group 
    echo "%wheel  ALL=(ALL)       ALL" >> /etc/sudoers
    # for user
    echo "${CONFIG_USER_NAME}  ALL=(ALL)       ALL" >> /etc/sudoers

    #######################################################
    ##    Setup User Env
    #######################################################
    mkdir -p ${var_home_path}/tools/
    cp -rf ${CONFIG_TOOL_PATH}/setup/bashrc ${var_home_path}/tools/
    cp -rf ${CONFIG_TOOL_PATH}/setup/vimrc ${var_home_path}/tools/
    chown ${CONFIG_USER_NAME}:${CONFIG_USER_NAME} ${var_home_path}/tools
    ln -sf ${var_home_path}/tools/vimrc ${var_home_path}/.vimrc
    echo "source ${var_home_path}/tools/bashrc" >> ${var_home_path}/.bashrc
}

function fMain()
{
    echo "Linux setup"
    local flag_account=n
    while [[ ${#} > 0 ]]
    do
        case ${1} in
            --account)
                flag_account=y
                ;;
            --user)
                CONFIG_USER_NAME=${2}
                shift 1
                ;;
            --pass)
                CONFIG_USER_PASSWD=${2}
                shift 1
                ;;
            --tools)
                CONFIG_TOOL_PATH=${2}
                shift 1
                ;;
            -h|--help)
                fHelp
                exit 0
                ;;
            *)
                echo "Unknown Args: $@"
                fHelp
                exit 1
                ;;
        esac
        shift 1
    done

    ## Post settings
    if [ "${flag_account}" = "y" ]
    then
        fUser_setup
    fi
}
fMain $@
