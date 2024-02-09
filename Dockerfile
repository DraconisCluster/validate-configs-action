FROM alpine:3.18
COPY entrypoint.sh /entrypoint.sh
RUN apk --no-cache add curl tar && \
  curl https://github.com/Terif1/config-file-validator/releases/download/v1.5.1/validator-v1.5.1-linux-386.tar.gz \
  -o /tmp/validator-v1.5.1-linux-386.tar.gz  -s -L && \
  tar -xvf /tmp/validator-v1.5.1-linux-386.tar.gz -C /tmp && \
  mv /tmp/validator /usr/local/bin && \
  rm -rf /tmp/* && \
  chmod 0755 /usr/local/bin/validator && \
  chmod 0755 /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
