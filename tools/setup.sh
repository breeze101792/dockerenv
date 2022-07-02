#!/binash
##################################################################
####    config
##################################################################
CONFIG_USER_NAME="docker"
CONFIG_USER_PASSWD="123456"

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
    ln -s /usr/share/zoneinfo/Asia/Taipei /etc/localtime
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
    cp -rf /root/tools ${var_home_path}/tools
    chown ${CONFIG_USER_NAME}:${CONFIG_USER_NAME} ${var_home_path}/tools
    ln -sf ${var_home_path}/tools/vimrc ${var_home_path}/.vimrc
    echo "source ${var_home_path}/tools/bashrc" >> ${var_home_path}/.bashrc
}
function fUbuntu()
{
    fPrint_title "Ubuntu Setup"
    # Update system
    apt-get update
    apt-get upgrade -y

    # Install require pkg
    apt-get install -y apt-utils
    apt-get install -y sudo build-essential
    apt-get install -y tmux vim git
}
function fKali()
{
    fPrint_title "Kali Setup"
    # Update system
    apt-get update
    apt-get upgrade -y

    # Install require pkg
    # apt-get install -y apt-utils
    # apt-get install -y sudo build-essential
    apt-get install -y tmux vim git tmux
    apt-get install -y nmap man-db exploitdb
    apt-get install -y kali-linux kali-linux-all kali-linux-forensic kali-linux-full kali-linux-gpu kali-linux-pwtools kali-linux-rfid kali-linux-sdr kali-linux-top10 kali-linux-voip kali-linux-web kali-linux-wireless
}

function fMain()
{
    echo "Docker setup"
    local flag_distro='ubuntu'
    local flag_account=y
    while [[ ${#} > 0 ]]
    do
        case ${1} in
            --distro)
                echo 1
                flag_distro="$2"
                shift 1
                ;;
            --user)
                CONFIG_USER_NAME=${2}
                shift 1
                ;;
            --pass)
                CONFIG_USER_PASSWD=${2}
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

    if [ "${flag_distro}" = "ubuntu" ]
    then
        fUbuntu
    elif [ "${flag_distro}" = "kali" ]
    then
        fKali
    fi
    ## Post settings
    if [ "${flag_account}" = "y" ]
    then
        fUser_setup
    fi
}
fMain $@
