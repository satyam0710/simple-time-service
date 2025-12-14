FROM python:3.11-alpine

# Create non-root user
RUN addgroup -g 1001 appuser && \
    adduser -S appuser -u 1001 -G appuser

WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app
COPY app.py .

# Run as non-root
USER appuser

EXPOSE 8080

CMD ["python", "app.py"]
