FROM node:20.12.2

# Устанавливаем make и чистим кэш apt
RUN apt-get update && apt-get install -y make && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Отключаем все интерактивные запросы npm/npx
ENV CI=true

# Копируем только файлы зависимостей (оптимизация кэша Docker)
COPY app/package.json ./package.json
COPY app/package-lock.json ./package-lock.json

# Устанавливаем зависимости ВНУТРИ образа
RUN npm ci