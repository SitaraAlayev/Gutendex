FROM python:3.9
WORKDIR /app
# Install required system packages (libpq-dev is an example if you're using psycopg2 with PostgreSQL)
RUN apt-get update && apt-get install -y rsync libpq-dev gcc && apt-get clean && rm -rf /var/lib/apt/lists/*
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
EXPOSE 8000
COPY entrypoint.sh ./entrypoint.sh
RUN chmod +x entrypoint.sh
ENTRYPOINT [ "./entrypoint.sh"] 