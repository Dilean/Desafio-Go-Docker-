FROM golang:alpine3.21 AS builder
WORKDIR /app
COPY . .
RUN go build -o /main app.go

FROM scratch
WORKDIR /
COPY --from=builder /main /main
EXPOSE 8080
ENTRYPOINT ["/main"]