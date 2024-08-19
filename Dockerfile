FROM python:3.12.0-alpine

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /mahiri

COPY requirements.txt .
RUN pip install --no-cache-dir --upgrade -r requirements.txt

COPY . .

EXPOSE 5000
ENV FLASK_APP=app.py

CMD ["sh", "-c", "flask run --host=0.0.0.0 --port=${PORT:-5000}"]