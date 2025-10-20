# Используем легковесный образ
FROM nginx:alpine

# Копируем твой сайт в корень Nginx
COPY index.html /usr/share/nginx/html/



# Запускаем Nginx
CMD ["nginx", "-g", "daemon off;"]