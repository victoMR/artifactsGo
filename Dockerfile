# Build Go backend
FROM golang:1.20 as backend
WORKDIR /app
COPY backend/go.mod .
RUN go mod download
COPY backend/ .
RUN CGO_ENABLED=0 GOOS=linux go build -o api .

# Build Hugo frontend
FROM klakegg/hugo:0.107.0 as frontend
WORKDIR /app
COPY frontend/ .
RUN hugo --minify

# Runtime image
FROM alpine:latest
WORKDIR /app
COPY --from=backend /app/api .
COPY --from=frontend /app/public /static
EXPOSE 8080
CMD ["./api"]
