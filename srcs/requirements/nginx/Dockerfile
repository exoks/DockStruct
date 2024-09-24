FROM debian:bullseye

RUN  apt-get update -y && apt-get install -y nginx

COPY . .

# move the nginx config to right path
RUN ln -s /etc/nginx/sites-available/default ~/nginx.conf\
	&& cat config/default > ~/nginx.conf

EXPOSE 8080

CMD [ "nginx", "-g", "daemon off;" ]
