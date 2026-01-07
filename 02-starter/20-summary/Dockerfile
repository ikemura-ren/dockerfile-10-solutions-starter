FROM alpine:latest

WORKDIR /app
ENV MSG="Hello Docker Advanced"

COPY message.txt .

RUN echo "$MSG" >> message.txt

CMD ["cat", "message.txt"]
