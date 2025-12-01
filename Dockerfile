FROM nginx:alpine

# نسخ ملفات الموقع
COPY . /usr/share/nginx/html

# نسخ ملف الكونفيج
COPY nginx.conf /etc/nginx/nginx.conf

# إنشاء مجلدات الكاش + إعطاء صلاحيات
RUN mkdir -p /var/cache/nginx && \
    chown -R nginx:nginx /var/cache/nginx

# تغيير المستخدم إلى nginx (مهم جداً)
USER nginx

EXPOSE 3000

CMD ["nginx", "-g", "daemon off;"]
