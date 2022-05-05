#!/bin/bash

function calc_build_version() {
  local commit_info="$(git describe --tags --long)"
  local tokenized=(${commit_info//-/ })
  local hash="${tokenized[-1]}"
  local nth="${tokenized[-2]}"
  local tag="${commit_info%%"-${nth}-${hash}"}"
  if [ "$nth" = "0" ]; then
    echo "$tag"
  else
    echo "$hash"
  fi
}

build_ts="$(/bin/date +%y%m%d_%H%M%S)"
build_ver="$(calc_build_version)"

echo "${build_ts}-${build_ver}"
