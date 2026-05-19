### Hexlet tests and linter status:
[![Actions Status](https://github.com/zerg959/devops-for-developers-project-74/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/zerg959/devops-for-developers-project-74/actions)
[![devops-project1-push](https://github.com/zerg959/devops-for-developers-project-74/actions/workflows/push.yml/badge.svg)](https://github.com/zerg959/devops-for-developers-project-74/actions/workflows/push.yml)

# JavaScript Fastify Blog (DevOps Project)

Учебное Веб-приложение на Fastify с SSR-рендерингом, базой данных PostgreSQL и обратным прокси Caddy. Проект полностью контейнеризирован и готов к запуску через Docker Compose.

## 🐳 Docker Hub Image

**Имя образа:** `zerg959/devops-for-developers-project-74`  
**Ссылка:** https://hub.docker.com/r/zerg959/devops-for-developers-project-74

---

## 💻 Системные требования

Для локального запуска и разработки необходимо:

- **Docker Engine** `20.10+`
- **Docker Compose** `v2+`
- **Git**
- **ОС:** Linux, macOS или Windows (рекомендуется WSL2)
- **ОЗУ:** ≥ 2 ГБ (свободной памяти для контейнеров)
- **Порты:** `80`, `443` (Caddy) и `8080` (прямой доступ к приложению) должны быть свободны

> ⚠️ Локальная установка Node.js не требуется для запуска через Docker. Если планируете разрабатывать вне контейнеров, используйте Node.js `20.x`.

---

## 📥 Установка и запуск приложения

### 1. Клонирование репозитория

```bash
git clone https://github.com/zerg959/devops-for-developers-project-74.git
cd devops-for-developers-project-74
```

### 2. Создание файла конфигурации окружения (данные для создания БД)

```bash
cp app/.env.example .env
```
Актуализируйте .env при необходимости вашими учётными данными 

### 3. Запуск стека контейнеров

```bash
docker compose up
```
Приложение будет доступно по адресам:
http://0.0.0.0 (через Caddy, HTTP/HTTPS)
http://0.0.0.0:8080 (напрямую к Fastify)
или через localhost

### 4. Остановка проекта
# Обычная остановка
```bash
docker compose down
```
# Полное удаление (включая БД и тома)

```bash
docker compose down --volumes --remove-orphans
```

### 5. Конфигурация
Настройки передаются через переменные окружения в файле .env в корне проекта:

- DATABASE_HOST=db - Хост БД. Внутри Docker оставить db, для локального запуска без Docker используйте localhost
- DATABASE_PORT=5432 - Порт PostgreSQL
- DATABASE_NAME=postgres - Имя базы данных
- DATABASE_USERNAME=postgres - Пользователь БД
- DATABASE_PASSWORD=postgres - Пароль пользователя БД

### 6. Тестирование
# Запуск тестов в отдельном контейнере
```bash
docker compose run --rm app make test
```
# Или напрямую через npm
```bash
docker compose run --rm app npm test
```