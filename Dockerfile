
FROM ubuntu:latest as runtime
LABEL "repository"="https://github.com/SmileSB101-syncker/action-sync-gitee-repo"
LABEL "maintainer"="SmileSB101"

RUN apk update \
  && apk upgrade \
  && apk add --no-cache git
  
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
