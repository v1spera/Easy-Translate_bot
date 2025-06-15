# Используем официальный образ Python
FROM python:3.9-slim

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем зависимости
COPY requirements.txt .

# Устанавливаем зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Копируем остальные файлы проекта
COPY . .

# Защита от случайного раскрытия .env
RUN if [ -f .env ]; then echo "WARNING: .env file should not be in the image!" && exit 1; fi

# Указываем переменные окружения, которые должны быть установлены
ENV TELEGRAM_BOT_TOKEN=""
ENV YANDEX_API_KEY=""
ENV YANDEX_SPEECHKIT_API_KEY=""

# Команда для запуска бота
CMD ["python", "main.py"]
