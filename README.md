# rust-ci-docker-template

## Usage

* build image

  ```sh
  $ export TARGET=i686-unknown-linux-musl
  $ export TOOLCHAIN=stable
  $ export IMAGENAME="ubnt-intrepid/rust-$TARGET:$TOOLCHAIN"

  $ ./docker/build_image.sh $TARGET $TOOLCHAIN $IMAGENAME
  ```

* start container

  ```sh
  $ ./ci/install.sh $TARGET $TOOLCHAIN
  ```

* build by using docker

  ```sh
  $ docker exec -it rust cargo build
  ```

## License
MIT license. See [LICENSE](LICENSE) for details.

