#!/bin/bash

script_dir="$(cd $(dirname $BASH_SOURCE); pwd)"

set -euo pipefail

#= PARAMETERS ===================================

target="${1:-x86_64-unknown-linux-gnu}"
toolchain="${2:-stable}"
container_name="${3:-rust}"

#================================================


image_name="ubntintrepid/rust-${target}:${toolchain}"

start_container() {
  docker rm -f "$container_name" || true
  docker run --name "$container_name" -d -it --privileged -v "$(pwd)":/root/src "$image_name"
}

case `uname -s` in
  Linux)
    if [[ "$(docker images -q "$image_name" | wc -l)" = 0 ]]; then
      $script_dir/../docker/build_image.sh "$target" "$toolchain" "$image_name"
    fi
    start_container "$image_name" "$container_name"
    # check installation
    docker exec -it "$container_name" rustup --version
    docker exec -it "$container_name" rustup target list | grep 'default\|installed'
    docker exec -it "$container_name" cargo --version
    ;;

  Darwin)
    curl -sSf https://sh.rustup.rs | sh -s -- -y --default-toolchain "$toolchain" --default-host "$target"
    source $HOME/.cargo/env
    # check installation
    rustup --version
    rustup target list | grep 'default\|installed'
    cargo --version
    ;;
esac
