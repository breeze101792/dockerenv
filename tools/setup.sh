CONFIG_USER_NAME="docker"
CONFIG_USER_PASSWD="123456"
function fUser_setup()
{
    local var_home_path="/home/${CONFIG_USER_NAME}"
    #######################################################
    ##    Accound settings
    #######################################################
    # Add user
    groupadd wheel
    useradd -G wheel -d ${var_home_path} -m docker
    echo ${CONFIG_USER_NAME}:${CONFIG_USER_PASSWD} | chpasswd

    #######################################################
    ##    Setup User Env
    #######################################################
    cp -rf /root/tools ${var_home_path}/tools
    chown ${CONFIG_USER_NAME}:${CONFIG_USER_NAME} ${var_home_path}/tools
    ln -sf ${var_home_path}/tools/vimrc ${var_home_path}/.vimrc
    echo "source ${var_home_path}/tools/bashrc" >> ${var_home_path}/.bashrc

}
function fUbuntu()
{
    # Update system
    apt-get update
    #  apt-get upgrade -y

    # Install require pkg
    apt-get install -y apt-utils
    apt-get install -y sudo build-essential
    apt-get install -y tmux vim git

    # setup sudo
    # group 
    echo "%wheel  ALL=(ALL)       ALL" >> /etc/sudoers
    # for user
    echo "docker  ALL=(ALL)       ALL" >> /etc/sudoers

    # use base as sh instead of dash
    ln -sf /bin/bash /bin/sh
}
function fMain()
{
    echo "Docker setup"
    local flag_ubuntu=n
    local flag_account=y
    while [[ ${#} > 0 ]]
    do
        case ${1} in
            --ubuntu)
                flag_ubuntu=y
                ;;
            --user)
                CONFIG_USER_NAME=${2}
                shift 1
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

    if [ "${flag_ubuntu}" = "y" ]
    then
        fUbuntu
    fi
    ## Post settings
    if [ "${flag_account}" = "y" ]
    then
        fUser_setup
    fi
}
fMain $@
