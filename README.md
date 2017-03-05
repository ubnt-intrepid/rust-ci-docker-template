# rust-ci-docker-template

## Usage

* Building image && start container
  ```sh
  $ export TARGET=x86_64-unknown-linux-musl
  $ export TOOLCHAIN=stable
  $ export CONTAINER_NAME=rust

  $ ./ci/install.sh "${TARGET}" "${TOOLCHAIN}" "${CONTAINER_NAME}"
  ```

  First, a docker image will be created with named `ubntintrepid/rust-"$TARGET":"$TOOLCHAIN"`.
  If the image has already created, skip building the image.

  Next, a container will be created with named `$CONTAINER_NAME`.
  Working directory of the container is set at `/root/src`, which is mounted at host's current working directory.

* Compiling using docker container
  ```sh
  $ docker exec -it "${CONTAINER_NAME}" cargo build
  ```

## Installation for deploying
* Copy `ci/*`, `.travis.yml` and `appveyor.yml` into your project's directory
* Replace `$CRATE_NAME` and API keys to your project's values

## License
MIT license. See [LICENSE](LICENSE) for details.

