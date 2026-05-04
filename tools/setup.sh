#!/binash
##################################################################
####    config
##################################################################
CONFIG_USER_NAME="ducky"
CONFIG_GROUP_NAME="ducky"
CONFIG_USER_PASSWD="123456"
CONFIG_HOST_UID="1000"
CONFIG_HOST_GID="1000"

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
    # Remove original account
    echo "Checking UID:${CONFIG_HOST_UID}/GID:${CONFIG_HOST_GID}"
    # Check if UID ${CONFIG_HOST_UID} exists
    if getent passwd ${CONFIG_HOST_UID} > /dev/null; then
        echo "UID ${CONFIG_HOST_UID} exists. Deleting..."
        userdel -r $(getent passwd ${CONFIG_HOST_UID} | cut -d: -f1)
    # else
    #     echo "UID ${CONFIG_HOST_UID} does not exist."
    fi

    # Check if GID ${CONFIG_HOST_GID} exists
    if getent group ${CONFIG_HOST_GID} > /dev/null; then
        echo "GID ${CONFIG_HOST_GID} exists. Deleting..."
        groupdel $(getent group ${CONFIG_HOST_GID} | cut -d: -f1)
    # else
    #     echo "GID ${CONFIG_HOST_GID} does not exist."
    fi
    
    # Add user account
    groupadd ${CONFIG_GROUP_NAME} -g ${CONFIG_HOST_GID}
    useradd -g ${CONFIG_GROUP_NAME} -d ${var_home_path} -u ${CONFIG_HOST_UID} -m ${CONFIG_USER_NAME}
    echo ${CONFIG_USER_NAME}:${CONFIG_USER_PASSWD} | chpasswd

    # setup sudo
    if command -v "sudo"; then
        # group
        echo "%${CONFIG_GROUP_NAME}  ALL=(ALL)       ALL" >> /etc/sudoers
        # user
        echo "${CONFIG_USER_NAME}  ALL=(ALL)       ALL" >> /etc/sudoers
    fi

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
            --group)
                CONFIG_GROUP_NAME=${2}
                shift 1
                ;;
            --uid)
                CONFIG_HOST_UID=${2}
                shift 1
                ;;
            --gid)
                CONFIG_HOST_GID=${2}
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
