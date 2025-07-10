# Build Go backend
FROM golang:1.24.5 as backend
WORKDIR /app
COPY backend/go.mod .
RUN go mod download
COPY backend/ .
RUN CGO_ENABLED=0 GOOS=linux go build -o api .




# Runtime image
FROM alpine:latest
WORKDIR /app
COPY --from=backend /app/api .

# Copy static files from frontend
COPY frontend/static/ ./static/

EXPOSE 8080
CMD ["./api"]
