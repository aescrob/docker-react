FROM node:alpine3.12 as builder

WORKDIR '/app'

COPY  package.json .
RUN npm install
COPY  . .

CMD ["npm", "run", "build" ]



FROM nginx

#Only relevant if deployed to AWS Elastic beanstalk
#EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html