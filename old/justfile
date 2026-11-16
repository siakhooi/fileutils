set-version:
	scripts/set-version.sh
clean:
	rm -rf target *.rpm* *.deb*

build-deb: clean
	./scripts/shellcheck.sh
	scripts/build-deb.sh

build-rpm: clean
	./scripts/shellcheck.sh
	scripts/build-rpms.sh
shellcheck:
	scripts/shellcheck.sh
all-deb: clean set-version build-deb deb-install
all-rpm: clean set-version build-rpm rpm-install

release:
	scripts/create-release.sh
deb-install:
	sudo apt install ./*.deb
deb-uninstall:
	sudo apt remove -y siakhooi-fileutils
rpm-install:
	sudo rpm -i ./*.rpm
rpm-uninstall:
	sudo rpm -e siakhooi-fileutils
root := justfile_directory()
docker-test:
	docker run --rm -v {{ root }}:/workspaces docker.io/siakhooi/devcontainer:deb2604 scripts/bats-test.sh

docker-build-rpm:
	docker run --rm -v {{ root }}:/workspaces docker.io/siakhooi/devcontainer:rpm44 scripts/build-rpms.sh
docker-build-deb:
	docker run --rm -v {{ root }}:/workspaces docker.io/siakhooi/devcontainer:deb2604 scripts/build-deb.sh

all: clean set-version shellcheck docker-build-deb docker-build-rpm
