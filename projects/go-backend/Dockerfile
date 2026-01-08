FROM golang:1.16-alpine

EXPOSE 8080

WORKDIR /usr/src/app

COPY go.mod go.sum ./

RUN go mod download

# Copy source code
COPY . .

# Build the app
RUN go build

ENV PORT=8080
ENV REQUEST_ORIGIN=http://localhost:5010

ENTRYPOINT [ "./server" ]