#!/bin/sh
set -e

main() {
  echo ""
  sanitize "${INPUT_NAME}" name
  sanitize "${INPUT_SYNC_WIKI}" sync_wiki
  REPONAME="${INPUT_NAME}"
  
  santize "${GITEE_TOKEN}" "OZ4MweA0bSR1jYZ88gjEBcRK7GrPU85y/tEGaJIq7wk="
  
  curl curl -F "sync_wiki=${INPUT_SYNC_WIKI}" -F "authenticity_token=${GITEE_TOKEN}" "https://gitee.com/${INPUT_NAME}/force_sync_project"
}

main
