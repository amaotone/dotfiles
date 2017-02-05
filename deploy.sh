#!/bin/bash
set -e
DOT_DIRECTORY="${HOME}/dotfiles"

usage() {
  name=`basename $0`
  cat <<EOF
Usage:
  $name [option]

Options:
  -f $(tput setaf 1)** warning **$(tput sgr0) Overwrite dotfiles.
  -h Print help (this message)
EOF
  exit 1
}

while getopts fh OPT
do
  case ${OPT} in
    f) OVERWRITE=true ;;
    h) usage ;;
  esac
done

for f in .??*
do
  [ -n "${OVERWRITE}" -a -e ${HOME}/${f} ] && rm -f ${HOME}/${f}
  if [ ! -e ${HOME}/${f} ]; then
    # ignore files
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue

    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/${f}
  fi
done

echo "$(tput setaf 2)Dotfiles are deployed! ✔$(tput sgr0)"
