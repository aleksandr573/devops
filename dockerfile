# syntax=docker/dockerfile:1
FROM python:3.10-alpine
WORKDIR /code
ENV FLASK_APP=app.py
ENV FLASK_RUN_HOST=0.0.0.0
# легковесный линукс с питоном
# переменные окружения
RUN apk add --no-cache gcc musl-dev linux-headers
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
EXPOSE 5000
# ставим зависимости
# заметка для админа, какой порт потом надо публиковать
COPY app.py .
# копируем из текущего каталога в workdir
CMD ["flask", "run", "--debug"]
