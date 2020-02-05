FROM golang:latest as builder

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64
# WORKDIR /go/src/github.com/yokoe/go-server-example
WORKDIR /go/src/github.com/Jun1Kato/heroku-server-go
COPY . .
RUN go build server.go

# runtime image
FROM alpine
# COPY --from=builder /go/src/github.com/yokoe/go-server-example /app
COPY --from=builder /go/src/github.com/Jun1Kato/heroku-server-go /app

CMD /app/server $PORT