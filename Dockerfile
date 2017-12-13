FROM keymetrics/pm2:latest

WORKDIR /

RUN apk add --no-cache git
RUN git clone -b docker https://github.com/Group2000/webservice-wifi.git \
&& git clone -b docker https://github.com/Group2000/celldata-parser.git \
&& git clone -b docker https://github.com/Group2000/webservice-cells.git \
&& git clone -b docker https://github.com/Group2000/measurement-amqp2es.git 
#\
#&& git clone https://github.com/Group2000/cellmapping-frontend.git

WORKDIR /webservice-wifi
RUN npm install
WORKDIR /

WORKDIR /webservice-cells
RUN npm install
WORKDIR /

WORKDIR /measurement-amqp2es
RUN npm install
WORKDIR /

WORKDIR /celldata-parser
RUN npm install
WORKDIR /
VOLUME /celldata-parser/data

COPY config/pm2.json .

EXPOSE 3001 3002

CMD [ "pm2-docker", "start", "pm2.json" ]
