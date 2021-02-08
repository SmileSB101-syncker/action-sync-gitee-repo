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
  
  GITEE_TOKEN="OZ4MweA0bSR1jYZ88gjEBcRK7GrPU85y/tEGaJIq7wk="
  
  COOKIEHEADER="Cookie:user_locale=zh-CN; oschina_new_user=false; close_wechat_tour=true; remote_way=http; tz=Asia%2FShanghai; SL_GWPT_Show_Hide_tmp=1; SL_wptGlobTipTmp=1; remember_user_token=BAhbCFsGaQP5qQ1JIiIkMmEkMTAkWUhRdm5JeDFmVkRlclZjV0NOa3RSLgY6BkVUSSIXMTYxMjU4OTEwNi42MTA3OTc2BjsARg%3D%3D--3bfc358578c58b2e2e076e817439b75c5f53780a; Hm_lvt_24f17767262929947cc3631f99bfd274=1612589093,1612589334,1612597084,1612748908; sensorsdata2015jssdkcross=%7B%22distinct_id%22%3A%22895481%22%2C%22first_id%22%3A%22175afdff7671e2-017daf1e3cf9b6-230346d-2073600-175afdff76897b%22%2C%22props%22%3A%7B%22%24latest_traffic_source_type%22%3A%22%E7%9B%B4%E6%8E%A5%E6%B5%81%E9%87%8F%22%2C%22%24latest_search_keyword%22%3A%22%E6%9C%AA%E5%8F%96%E5%88%B0%E5%80%BC_%E7%9B%B4%E6%8E%A5%E6%89%93%E5%BC%80%22%2C%22%24latest_referrer%22%3A%22%22%7D%2C%22%24device_id%22%3A%22175afdff7671e2-017daf1e3cf9b6-230346d-2073600-175afdff76897b%22%7D; Hm_lpvt_24f17767262929947cc3631f99bfd274=1612752140; gitee-session-n=YWIyN29HbjNPbWJEeG9tU3hrWXZRV05sZmxtZHdjV20rWlBlQlh1OFZMKy9Qanl4MnlCTUIrU2hGbUw0SFAzVVBFMk02OGJsUzNDTFVIV2h4QUNBTlQrbkJUWGk0eHRHU3hEbDZ0Umd0eGNudE5HTDJqSjlCRURlb2VneEV6cVhmbGEwR0ROQU5ISjdDaW9zM01EUmY2SDZkMnBIU2dvZXp1eFdPbXA0QXVuUTd1VGN1YitCVzhPckczVmdacm5MNzQyNWNGQUdTY0U0YTdUbU1EMmxUZHRzQnlkRUlZQmpDdW1iQTdKYUdBQ1pKcUt0MXc1eklVcVJaQVYrZTQ4OFM3Q25rQWJTVEY0V09ZK2JUOGpjMWtDQlV2dGRYeFVmL2Z5Rlh1cmgxNG81Z2tNS2M2N0k0Q1g4Zko4N04vNEgrUzBLcjlUUVN0US9VUi9BazB6MytpS0Z6MXI2TVozS2pGcXpSUTdycVBJPS0tTU54ZFMzWlFKKzdMTVh6MldyaVlwQT09--61f07d7c48aed375f659b7f3188adb15b22f4361"
  CONTENTTYPEHEADER="Content-Type:application/x-www-form-urlencoded"
  curl -X POST -H "${CONTENTTYPEHEADER}" -H "${COOKIEHEADER}" -F "sync_wiki=${SYNCWIKI}" -F "authenticity_token=${GITEE_TOKEN}" "https://gitee.com/${INPUT_NAME}/force_sync_project"
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
