FROM grafana/grafana-enterprise
ENV GF_INSTALL_PLUGINS="grafana-clock-panel, grafana-simple-json-datasource, speakyourcode-button-panel, volkovlabs-form-panel"

USER root
RUN apk add curl

# Set timezone
ENV TZ="Europe/Warsaw"
RUN apk add --no-cache tzdata

EXPOSE 3000

ENTRYPOINT [ "/run.sh" ]