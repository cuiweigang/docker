
FROM ubuntu
ENV TZ "Asis/Shanghai"

ADD sources.list /etc/apt/sources.list
#RUN apt-get update

RUN mkdir /var/app
ADD node-v6 /var/node-v6/
RUN ls /var/
#RUN apt-get install -y ln
RUN ln -s /var/node-v6/bin/node /usr/bin/node
RUN ln -s /var/node-v6/bin/npm /usr/bin/npm
RUN node -v
RUN npm install -g cnpm --registry=https://registry.npm.taobao.org

ADD ./src /var/app/ 
RUN ls /var/app
RUN cd /var/app/ && /var/node-v6/bin/cnpm install

EXPOSE 3001 3000

ENTRYPOINT ["/var/node-v6/bin/node","/var/app/app.js"]
