FROM vault
WORKDIR /work
RUN apk --no-cache add jq
COPY --from=hairyhenderson/gomplate:v2.6.0-alpine /bin/gomplate /bin/gomplate
COPY entrypoint.sh ./
COPY secrets.tmpl.env ./
ENTRYPOINT ["/bin/sh", "entrypoint.sh"]
