set-version:
	scripts/set-version.sh
clean:
	scripts/clean.sh
build-deb: clean
	./scripts/shellcheck.sh
	scripts/build-deb.sh
undeploy:
	scripts/undeploy.sh

build-rpm: clean
	./scripts/shellcheck.sh
	scripts/build-rpms.sh

un-all: undeploy clean
all-deb: clean set-version build-deb deb-install
all-rpm: clean set-version build-rpm rpm-install

release:
	scripts/release.sh
deb-install:
	sudo apt install ./*.deb
deb-uninstall:
	sudo apt remove -y siakhooi-fileutils
rpm-install:
	sudo rpm -i ./*.rpm
rpm-uninstall:
	sudo rpm -e siakhooi-fileutils
docker-build-rpm:
	docker run --rm -v $(CURDIR):/workspaces docker.io/siakhooi/devcontainer:rpm44 scripts/build-rpms.sh
docker-build-deb:
	docker run --rm -v $(CURDIR):/workspaces docker.io/siakhooi/devcontainer:deb2604 scripts/build-deb.sh