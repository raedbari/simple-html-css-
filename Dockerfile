FROM nginx:alpine

# نسخ ملفات HTML
COPY . /usr/share/nginx/html

# نسخ nginx.conf إلى مكانه داخل الحاوية
COPY nginx.conf /etc/nginx/nginx.conf

# أخبر Docker أن المنفذ 3000 هو المنفذ الأساسي
EXPOSE 3000

# تشغيل nginx
CMD ["nginx", "-g", "daemon off;"]
