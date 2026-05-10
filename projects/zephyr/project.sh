#!/bin/bash
VAR_WORKING_PATH="./"
VAR_SETUP_TITLE="zephyr"
printf "##################################################################\n"
printf "##  ${VAR_SETUP_TITLE} Experiment Environment Setup\n"
printf "##################################################################\n"
function fPrepare()
{
    printf "##################################################################\n"
    printf "## Prepare Setup\n"
    printf "##################################################################\n"
    fSetupZephyrSDK --download
}
function fSetupUser()
{
    printf "##################################################################\n"
    printf "## Finalize Setup\n"
    printf "##################################################################\n"
}
function fInfo()
{
    printf "##################################################################\n"
    printf "## Info\n"
    printf "##################################################################\n"
}
function fSetupZephyrSDK()
{
    # 1. Define Version and Target Directory
    local SDK_VERSION="1.0.0"
    local SDK_DIR="/tools/zephyr-sdk-${SDK_VERSION}"
    
    local HOST_ARCH=$(uname -m)
    case "${HOST_ARCH}" in
        x86_64)
            local ARCHIVE="zephyr-sdk-${SDK_VERSION}_linux-x86_64_gnu.tar.xz"
            ;;
        aarch64|arm64)
            local ARCHIVE="zephyr-sdk-${SDK_VERSION}_linux-aarch64_gnu.tar.xz"
            ;;
        *)
            echo "❌ Unsupported architecture: ${HOST_ARCH}"
            return 1
            ;;
    esac

    local URL="https://github.com/zephyrproject-rtos/sdk-ng/releases/download/v${SDK_VERSION}/${ARCHIVE}"

    # 2. Download
    local tmp_download_path="./"
    if [ ! -f "${tmp_download_path}/${ARCHIVE}" ]; then
        test -d "${tmp_download_path}" || mkdir -p "${tmp_download_path}"
        echo "📥 Downloading Zephyr SDK v${SDK_VERSION}..."
        if command -v aria2c &> /dev/null; then
            echo "🚀 Using aria2c for fast download..."
            aria2c -x 16 -s 16 -d "${tmp_download_path}" -o "${ARCHIVE}" "${URL}"
        elif command -v wget &> /dev/null; then
            echo "📥 Using wget..."
            wget "${URL}" -O "${tmp_download_path}/${ARCHIVE}"
        else
            echo "📥 Using curl..."
            curl -L "${URL}" -o "${tmp_download_path}/${ARCHIVE}"
        fi
    else
        echo "✅ Archive ${tmp_download_path}/${ARCHIVE} already exists, skipping download."
    fi

    if [[ "${#}" -eq "1" ]] && [[ ${1} = "--download" ]]
    then
        return 0
    fi

    # 3. Extract
    if [ -f "${tmp_download_path}/${ARCHIVE}" ]; then
        echo "📦 Extracting to ${SDK_DIR}..."
        mkdir -p "${SDK_DIR}"
        tar -xJf "${tmp_download_path}/${ARCHIVE}" -C "${SDK_DIR}" --strip-components=1
    fi

    # 3. Run SDK Setup Script (Crucial for host tools)
    echo "⚙️ Running SDK setup..."
    cd "${SDK_DIR}" && ./setup.sh -t all -h -c

    # 4. Export Variables for Docker/Shell
    export ZEPHYR_SDK_INSTALL_DIR="${SDK_DIR}"
    export ZEPHYR_TOOLCHAIN_VARIANT="zephyr"
    
    # 5. Register with West
    if command -v west &> /dev/null; then
        west config zephyr.sdk "${SDK_DIR}"
        echo "✅ SDK registered with West."
    fi

    echo "🚀 Zephyr SDK Setup Complete!"
}
function fGetDependency()
{
    printf "##################################################################\n"
    printf "## Get Dependency\n"
    printf "##################################################################\n"
    sudo apt install -y --no-install-recommends git cmake ninja-build gperf \
        ccache dfu-util device-tree-compiler wget python3 python3-dev python3-venv python3-tk \
        xz-utils file make gcc libsdl2-dev libmagic1

    sudo apt install -y --no-install-recommends curl

    if [ "$(uname -m)" = "x86_64" ]; then
        sudo apt install -y --no-install-recommends gcc-multilib g++-multilib
    fi
}
function fHelp()
{
    printf "Default Experiment Env\n"
    printf "[Options]\n"
    printf "    %s\t %s\n" "-h|--help"  "print help info, for docker help, do docker run --help"
    printf "    %s\t %s\n" "--info"     "print experiment environment info"
    return 0
}
function fMain()
{
    echo "${VAR_SETUP_TITLE} setup"
    local flag_info=n
    local flag_prepare=n
    local flag_setup=n
    local flag_user_setup=n
    while [[ ${#} > 0 ]]
    do
        case ${1} in
            --info)
                flag_info=y
                ;;
            --prepare)
                flag_prepare=y
                ;;
            --setup)
                flag_setup=y
                ;;
            --user-setup)
                flag_user_setup=y
                ;;
            --working-path)
                VAR_WORKING_PATH=$2
                shift 1
                ;;
            -h|--help)
                fHelp
                exit 0
                ;;
            *)
                echo "Unsupported Args, ignore the reset actions ${@}"
                exit 0
                ;;
        esac
        shift 1
    done
    pushd ${VAR_WORKING_PATH}
    if [ "${flag_info}" = "y" ]
    then
        fInfo
    fi
    if [ "${flag_prepare}" = "y" ]
    then
        fPrepare
    fi
    if [ "${flag_setup}" = "y" ]
    then
        fGetDependency
        fSetupZephyrSDK
    fi
    if [ "${flag_user_setup}" = "y" ]
    then
        fSetupUser
    fi
    popd
}

fMain $@
