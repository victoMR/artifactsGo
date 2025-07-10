# Multi-stage build

# Build Go backend
FROM golang:1.24.5 as backend
WORKDIR /app
COPY backend/go.mod .
RUN go mod download
COPY backend/ .
RUN CGO_ENABLED=0 GOOS=linux go build -o api .

# Build Hugo frontend
FROM hugomods/hugo:exts-0.139.0 as frontend
WORKDIR /src
COPY frontend/ .
RUN hugo --minify

# Runtime image
FROM alpine:latest
WORKDIR /app

# Install ca-certificates for HTTPS
RUN apk --no-cache add ca-certificates

# Copy backend binary
COPY --from=backend /app/api .

# Copy Hugo generated site
COPY --from=frontend /src/public ./static/

EXPOSE 8080
CMD ["./api"]
