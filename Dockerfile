FROM python:3.11-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /app

# 1️⃣ Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# 2️⃣ Copy project code
COPY . .

# 3️⃣ Copy entrypoint script (important)
COPY entrypoint.sh /entrypoint.sh

# 4️⃣ Give execution permission
RUN chmod +x /entrypoint.sh

# 5️⃣ Set entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# 6️⃣ Default command
CMD ["gunicorn", "config.wsgi:application", "--bind", "0.0.0.0:8000"]