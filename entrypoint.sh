#!/bin/sh
set -e

main() {
  echo ""
  sanitize "${INPUT_NAME}" name
  SYNCWIKI=${INPUT_SYNC_WIKI}
  if [ -z "${INPUT_SYNC_WIKI}" ]; then
    SYNCWIKI=false
  fi
  REPONAME="${INPUT_NAME}"
  
  santize "${GITEE_TOKEN}" "OZ4MweA0bSR1jYZ88gjEBcRK7GrPU85y/tEGaJIq7wk="
  
  curl curl -F "sync_wiki=${SYNCWIKI}" -F "authenticity_token=${GITEE_TOKEN}" "https://gitee.com/${INPUT_NAME}/force_sync_project"
}

sanitize() {
  if [ -z "${1}" ]; then
    >&2 echo "Unable to find the ${2}. Did you set with.${2}?"
    exit 1
  fi
}

uses() {
  [ ! -z "${1}" ]
}

main
