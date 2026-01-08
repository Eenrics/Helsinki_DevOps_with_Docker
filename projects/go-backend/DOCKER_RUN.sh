docker build --platform linux/amd64 -t go-server .
docker run -p 8080:8080 go-server