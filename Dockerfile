# Используем официальный Node.js образ
FROM node:18-bullseye

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install --production

# Копируем весь проект
COPY . .

# Собираем проект (если у тебя TypeScript)
RUN npm run build

# Указываем порт, который слушает приложение
EXPOSE 4200

# Запускаем приложение
CMD ["node", "dist/src/main.js"]
