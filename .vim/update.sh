#!/usr/bin/env bash

which curl >/dev/null || {
  echo "curl not found in path..."
  exit 1
}
which git >/dev/null || {
  echo "git not found in path..."
  exit 1
}

PATHOGEN_DIR="${HOME}/.vim/autoload"
BUNDLES_DIR="${HOME}/.vim/bundle"

if [[ -d "${PATHOGEN_DIR}" ]]; then
  echo "Updating pathogen..."
  curl -Sso "${PATHOGEN_DIR}/pathogen.vim" \
    https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim
fi

if [[ -d "${BUNDLES_DIR}" ]]; then
  echo "Updating bundles..."
  for bundle in "${BUNDLES_DIR}/"*; do
    if [[ -d "${bundle}/.git" ]]; then
      echo "Bundle: ${bundle}..."
      cd "${bundle}"
      git pull
    fi
  done
fi
