#!/usr/bin/env bash
set -Eeuo pipefail

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

#versions=( "$@" )
#if [ ${#versions[@]} -eq 0 ]; then
#	versions=( */ )
#	json='{}'
#else
#	json="$(< versions.json)"
#fi
#versions=( "${versions[@]%/}" )
#
ftpBase='https://ftp.gnu.org/gnu/bash'

latestBaseVersion="$(
	wget -qO- "$ftpBase/" \
		| sed -rne '/^(.*[/"[:space:]])?bash-([0-9].+)[.]tar[.]gz([/"[:space:]].*)?$/s//\2/p' \
                | grep -E '^[0-9]+[.][0-9]+$' \
		| sort -rV \
                | head -n 1
)"

echo $latestBaseVersion
