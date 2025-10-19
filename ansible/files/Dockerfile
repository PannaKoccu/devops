# Используем легковесный образ
FROM nginx:alpine

# Копируем твой сайт в корень Nginx
COPY index.html /usr/share/nginx/html/

# Порт 80 открыт по умолчанию в nginx:alpine — не нужно EXPOSE

# Запускаем Nginx
CMD ["nginx", "-g", "daemon off;"]