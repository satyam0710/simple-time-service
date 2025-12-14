# SimpleTimeService

A simple microservice that returns the current time and visitor's IP address.

## What it does

When you hit the `/` endpoint, you get:
```json
{
  "timestamp": "2025-12-14T10:30:45.123456Z",
  "ip": "192.168.1.100"
}
```

## Quick Start

### Build and run

```bash
cd app
docker build -t simple-time-service .
docker run -p 8080:8080 simple-time-service
```

Test it:
```bash
curl http://localhost:8080
```

### Pull from DockerHub

```bash
docker pull satyam0710/simple-time-service
docker run -p 8080:8080 satyam0710/simple-time-service
```

## Endpoints

- `GET /` - Returns timestamp and IP
- `GET /health` - Health check

## Local Development

```bash
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
python app.py
```

## Docker Details

- Based on Alpine Linux (~50MB image)
- Runs as non-root user (UID 1001)
- Uses Python 3.11

Check the user:
```bash
docker run --rm simple-time-service id
```

## Publishing to DockerHub

```bash
docker login
docker tag simple-time-service satyam0710/simple-time-service:latest
docker push satyam0710/simple-time-service:latest
```

## Project Structure

```
app/
├── app.py              # Flask app
├── requirements.txt    # Dependencies
├── Dockerfile          # Docker config
└── README.md          # This file
```
