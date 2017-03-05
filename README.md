# rust-ci-docker-template

## Usage

* Building image && start container
  ```sh
  $ TARGET=x86_64-unknown-linux-musl
  $ TOOLCHAIN=stable
  $ CONTAINER_NAME=rust

  $ ./ci/install.sh "${TARGET}" "${TOOLCHAIN}" "${CONTAINER_NAME}"
  ```

  Before creating container, a docker image will be created with named `ubntintrepid/rust-"$TARGET":"$TOOLCHAIN"`.
  If the image has already created, skip building the image.

  Working directory of the container is set at `/root/src`,
  which is mounted at host's current working directory.

* Compiling using docker container
  ```sh
  $ docker exec -it "${CONTAINER_NAME}" cargo build
  ```

## Android target
Currently, only `arm-linux-androideabi` and `i686-linux-android` are supported.
To build docker image, you should set the version of API to `$API`:

```sh
$ export API=23
$ ./ci/install.sh "arm-linux-androideabi" "stable" "rust-android"
```

## Installation for deploying
* Copy `ci/*`, `.travis.yml` and `appveyor.yml` into your project's directory
* Replace `$CRATE_NAME` and API keys to your project's values

## License
MIT license. See [LICENSE](LICENSE) for details.

