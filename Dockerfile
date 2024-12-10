FROM golang:alpine3.21 AS builder
WORKDIR /app
COPY go.mod .
COPY app.go .
RUN CGO_ENABLED=0 go build -ldflags="-s -w" -o /main

FROM scratch
WORKDIR /
COPY --from=builder /main /main
EXPOSE 8080
ENTRYPOINT ["/main"]