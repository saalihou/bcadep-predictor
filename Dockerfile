FROM python:3.7-slim-stretch

RUN apt-get update && apt-get install -y git python3-dev gcc build-essential cmake \
    && rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/local/cuda-5.5 /usr/local/cuda

COPY requirements.txt .

RUN pip install --upgrade -r requirements.txt

COPY . .

ENV FLASK_APP=server.py

EXPOSE 5000

CMD ["python", "-m", "flask", "run"]