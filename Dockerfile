FROM node:10.16-alpine

WORKDIR /app/build

COPY . .
#RUN npm audit fix --force
RUN npm install

RUN npm install @angular/cli@7.3.9
ENV PATH /app/build/node_modules/.bin:$PATH
RUN ng build --prod --build-optimizer
EXPOSE 4200
CMD ng serve --host 0.0.0.0
