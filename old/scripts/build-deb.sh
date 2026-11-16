#!/usr/bin/env bash
#
# Description: Build a Debian package from the source files.
# Usage: ./build-deb.sh [options]
#

set -euo pipefail

# ===== Constants =====
readonly build_home=target
readonly source_home=src

# ===== Argument Parsing =====
parse_args() {
	while getopts "h" opt; do
		case "${opt}" in
		h)
			usage
			exit 0
			;;
		*)
			usage
			exit 1
			;;
		esac
	done
	shift $((OPTIND - 1))
}
# ===== Helper Functions =====
copy_control_files() {
	mkdir -p "$build_home/DEBIAN"
	cp -vr "$source_home/DEBIAN"/* "$build_home/DEBIAN/"
}
copy_binary_files() {
	mkdir -p "$build_home/usr/bin"
	#	cp -vr "$source_home/bin"/* "$build_home/usr/bin/"
	find $source_home/bin -type f -exec cp -vr {} "$build_home/usr/bin" \;
	chmod 755 "$build_home/usr/bin/"*
}
build_deb_package() {
	fakeroot dpkg-deb --build -Zxz $build_home
}
rename_deb_package() {
	dpkg-name ${build_home}.deb
}
generate_checksums() {
	DEBFILE=$(basename "$(ls ./*.deb)")
	sha256sum "$DEBFILE" >"$DEBFILE.sha256sum"
	sha512sum "$DEBFILE" >"$DEBFILE.sha512sum"
}
list_deb_contents() {
	DEBFILE=$(ls ./*.deb)
	dpkg --contents "$DEBFILE"
}
# ===== Main Logic =====
main() {

	# shellcheck disable=SC1091
	source ./release.env

	parse_args "$@"

	copy_control_files
	copy_binary_files

	build_deb_package
	rename_deb_package
	generate_checksums

	list_deb_contents
}
# ===== Entrypoint =====
main "$@"
