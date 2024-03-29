FROM python:3.7-slim-stretch

RUN apt-get update && apt-get install -y git python3-dev gcc build-essential cmake \
    && rm -rf /var/lib/apt/lists/*

ENV CUDA_HOME=/usr/local/cuda
ENV LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}
ENV PATH=${CUDA_HOME}/bin:${PATH}
ENV CUDA_BIN_PATH=${CUDA_HOME}


COPY requirements.txt .

RUN pip install --upgrade -r requirements.txt

COPY . .

ENV FLASK_APP=server.py

EXPOSE 5000

CMD ["python", "-m", "flask", "run", "--host=0.0.0.0"]
