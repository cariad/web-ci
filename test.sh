#!/bin/bash -e

li="\033[1;34m↪\033[0m "  # List item
nk="\033[0;31m⨯\033[0m "  # Not OK
ok="\033[0;32m✔️\033[0m "  # OK

expect=1
found=0

while IFS="" read -r file_path
do
  echo -e "${li:?}Validating: ${file_path:?}"
  shellcheck --check-sourced --enable=all --severity style -x "${file_path:?}"
  found=$((found + 1))
done < <(find . -name "*.sh")

if [[ "${expect:?}" != "${found:?}" ]]; then
  echo -e "${nk:?}Expected ${expect:?} scripts but found ${found:?}"
  exit 1
fi

echo -e "${li:?}Validating YAML…"
yamllint . --strict

echo -e "${LI:?}Linting Dockerfile…"
hadolint Dockerfile

echo -e "${ok:?}OK!"
