#!/bin/bash
if test -d "./.venv-zephyr"; then
    exit 0
fi

read -p "Virtual environment .venv-zephyr not found. Do you want to proceed with creation? (y/n) " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]
then
    exit 1
fi

python3 -m venv .venv-zephyr
source .venv-zephyr/bin/activate

pip install west

# dectact west folder
WEST_APP_PATH="$(dirname */west.yml)"
echo "####################################"
echo "##  APP |${WEST_APP_PATH}|"
echo "####################################"

## west init
# 1. use remote URL to init(-m specify manifest)
west init -l ${WEST_APP_PATH}

# 2. config git safe dir
# git config --global --add safe.directory /workdir/zephyr

# 3. enter app(west init will clone to here)
cd ${WEST_APP_PATH}

# 4. pull all repo (define on west.yml )
west update

# 5. check dir structure
ls
# You will see .west/  app/  zephyr/  modules/ ...

# install sdk
# west sdk install

# install deps
west packages pip --install

if test -f "zephyr/scripts/requirements.txt"; then
    pip install -r zephyr/scripts/requirements.txt
else
    echo "Zephyr not found."
fi

# git config --global --add safe.directory /workdir/
