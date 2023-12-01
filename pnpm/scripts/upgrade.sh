#!/bin/sh

# https://pnpm.io/installation#using-a-standalone-script
# curl -fsSL https://get.pnpm.io/install.sh | sh -

NC='\033[0m'
BLUE='\033[0;34m'
GREEN='\033[0;32m'

abort() {
  printf "%s\n" "$@"
  exit 1
}

download() {
  curl -fsSL "$1"
}

validate_url() {
  curl --output /dev/null --silent --show-error --location --head --fail "$1"
}

upgrade() {
  local platform arch version_json version archive_url install_dir

  platform="macos"
  arch="arm64"
  
  version_json="$(download "https://registry.npmjs.org/@pnpm/exe")" || abort "Download Error!"
  version="$(printf '%s' "${version_json}" | tr '{' '\n' | awk -F '"' '/latest/ { print $4 }')"

  # check if current pnpm version matches $version
  if [ -x "$(command -v pnpm)" ]; then
    if [ "$(pnpm --version)" = "${version}" ]; then
      printf "${GREEN}Congrats!${NC} You're already on the latest version of pnpm: ${BLUE}${version}${NC}\n"
      exit 0
    fi
  fi
  
  archive_url="https://github.com/pnpm/pnpm/releases/download/v${version}/pnpm-${platform}-${arch}"
  validate_url "$archive_url" || abort "pnpm version '${version}' could not be found"

  install_dir="$PNPM_HOME/bin"
  if [ ! -d "$install_dir" ]; then
    mkdir -p "$install_dir"
  fi

  printf "Downloading latest pnpm version: ${BLUE}${version}${NC}\n"
  
  download "$archive_url" > "$install_dir/pnpm"  || return 1
  chmod +x "$install_dir/pnpm"

  printf "${GREEN}Success:${NC} ${BLUE}"$install_dir/pnpm"${NC}\n"
}

upgrade || abort "Upgrade error!"
