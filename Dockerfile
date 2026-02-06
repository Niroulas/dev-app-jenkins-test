FROM python:3.11-slim

WORKDIR /app

COPY sushant.py .

CMD ["python", "sushant.py"]
