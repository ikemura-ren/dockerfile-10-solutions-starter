FROM alpine:latest
COPY . /app
CMD ["sh", "-c", "ls /app/secret.txt 2>/dev/null || echo OK"]
