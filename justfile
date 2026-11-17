default:
    @just --list
clean:
    rm -rf target
shellcheck:
	./scripts/shellcheck.sh
format-scripts:
  ./scripts/format-scripts.sh
build:
    ./scripts/build-packages.sh
release:
    ./scripts/create-release.sh

root := justfile_directory()

all: clean format-scripts shellcheck build
