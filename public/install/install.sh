#!/bin/sh

NC='\033[0m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'

if [ "$1" = "brew" ]; then
    printf "Installing: ${GREEN}brew${NC} \n"
    source ./brew/install.sh

elif [ "$1" = "n" ]; then
    printf "Installing: ${GREEN}n${NC} \n"
    source ./n/install.sh

elif [ "$1" = "deno" ]; then
    printf "Installing: ${GREEN}deno${NC} \n"
    source ./deno/install.sh

elif [ "$1" = "bun" ]; then
    printf "Installing: ${GREEN}bun${NC} \n"
    source ./bun/install.sh

elif [ "$1" = "all" ]; then
    echo "Installing: ${GREEN}brew n deno bun${NC} \n"
    source ./brew/install.sh
    source ./n/install.sh
    source ./deno/install.sh
    source ./bun/install.sh

else
    printf "Missing argument: ${BLUE}[ brew | n | deno | bun | all ]${NC} \n"
fi
