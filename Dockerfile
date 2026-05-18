FROM node:20.12.2

# Устанавливаем make и чистим кэш apt
RUN apt-get update && apt-get install -y --no-install-recommends make=4.3-4.1 && rm -rf /var/lib/apt/lists/*
WORKDIR /app

# Отключаем все интерактивные запросы npm/npx
ENV CI=true

# Копируем только файлы зависимостей (оптимизация кэша Docker)
COPY app/package.json ./package.json
COPY app/package-lock.json ./package-lock.json

# Устанавливаем зависимости ВНУТРИ образа
RUN npm ci

# Копируем исходный код приложения
COPY app/. .

# Команда запуска по умолчанию
CMD ["make", "dev"]