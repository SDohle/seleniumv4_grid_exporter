FROM golang:1.17.0 AS builder
WORKDIR seleniumv4_grid_exporter
COPY . .
RUN go build
RUN ls -la
RUN cp selenium_grid_exporter /usr/local/bin/

FROM golang:1.17.0
COPY --from=builder /usr/local/bin/selenium_grid_exporter /

EXPOSE 8080
ENTRYPOINT ["/selenium_grid_exporter"]
