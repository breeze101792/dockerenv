#!/bin/bash

if test -d "./.venv-zephyr" && test -d "./.west"; then
    exit 0
else
    read -p ".venv-zephyr/.west not found. Do you want to proceed with creation? (y/N) " -n 1 -r
    echo ""
    if [[ ! $REPLY =~ ^[Yy]$ ]]
    then
        exit 1
    fi
fi

if ! test -d "./.venv-zephyr"; then
    echo "####################################"
    echo "##  Create Venv"
    echo "####################################"

    python3 -m venv .venv-zephyr
fi

# source venv
source .venv-zephyr/bin/activate

if ! test -d "./.west"; then
    # detect west manifest directory
    WEST_APP_PATH="$(dirname */west.yml)"
    echo "####################################"
    echo "##  APP |${WEST_APP_PATH}|"
    echo "####################################"
    if ! test -f "./${WEST_APP_PATH}/west.yml"; then
        echo "Can't find west.yml"
        exit 1
    fi

    # install west tool
    pip install west

    ## west init
    # Initialize west using the local manifest directory (-l)
    west init -l ${WEST_APP_PATH}

    # 2. pull all repositories defined in west.yml
    west update

    # 3. install python dependencies via west
    west packages pip --install

    # 4. install additional zephyr requirements if present
    if test -f "zephyr/scripts/requirements.txt"; then
        pip install -r zephyr/scripts/requirements.txt
    else
        echo "Zephyr not found."
    fi

    # git config --global --add safe.directory /workdir/
fi
