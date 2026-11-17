#!/usr/bin/env bash
#
# Description: Run shfmt on all scripts in the src/bin directory.
# Usage: ./format-scripts.sh [options]
#

set -euo pipefail

if ! command -v shfmt &>/dev/null; then
  echo "Error: shfmt is not installed. Please install it to run this script."
  exit 1
fi

set -x
shfmt -i 2 -w src/bin scripts
