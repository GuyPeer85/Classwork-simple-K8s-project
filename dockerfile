FROM node:14.17.0
RUN apt-get update
EXPOSE 3043
# Create app directory
RUN mkdir -p /opt/backand
WORKDIR /opt/backand
COPY portal-code /opt/backand/
RUN npm install
RUN npm i axios
RUN npm i pdf-lib
RUN npm i fontkit
RUN npm i node-schedule
RUN npm i xmlbuilder
RUN npm i utf8
RUN npm i ics
RUN npm i @sendgrid/mail
CMD ["npm", "start"]