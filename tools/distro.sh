#!/binash
##################################################################
####    config
##################################################################

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
function fArchlinux()
{
    fPrint_title "Archlinux Setup"
    # Update system
    pacman -Syyu --noconfirm
    pacman -S --noconfirm base-devel sudo
    pacman -S --noconfirm vim git
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
    echo "Distro setup"
    local flag_distro=''
    local flag_account=n
    while [[ ${#} > 0 ]]
    do
        case ${1} in
            --distro)
                echo 1
                flag_distro="$2"
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

    if [ "${flag_distro}" = "ubuntu" ]
    then
        fUbuntu
    elif [ "${flag_distro}" = "archlinux" ]
    then
        fArchlinux
    elif [ "${flag_distro}" = "kali" ]
    then
        fKali
    else
        echo "ignore distro setup."
    fi
}
fMain $@
