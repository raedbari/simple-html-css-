FROM nginx:alpine

# نسخ ملفات الموقع
COPY . /usr/share/nginx/html

# نسخ ملف الكونفيج
COPY nginx.conf /etc/nginx/nginx.conf

# إعطاء صلاحيات ملفات HTML/CSS/JS
RUN chown -R nginx:nginx /usr/share/nginx/html

# إنشاء جميع مجلدات الكاش المطلوبة وإعطاء صلاحيات للمستخدم nginx
RUN mkdir -p /var/cache/nginx/client_temp && \
    mkdir -p /var/cache/nginx/proxy_temp && \
    mkdir -p /var/cache/nginx/fastcgi_temp && \
    mkdir -p /var/cache/nginx/uwsgi_temp && \
    mkdir -p /var/cache/nginx/scgi_temp && \
    chown -R nginx:nginx /var/cache/nginx

# تشغيل NGINX كمستخدم غير root
USER nginx

EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
