FROM node:alpine3.12

WORKDIR '/app'

COPY  package.json .
RUN npm install
COPY  . .

CMD ["npm", "run", "build" ]



FROM nginx

#Only relevant if deployed to AWS Elastic beanstalk
EXPOSE 80

COPY --from=0 /app/build /usr/share/nginx/html