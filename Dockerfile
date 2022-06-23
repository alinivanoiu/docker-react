FROM node:alpine3.16 as builder

WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build


FROM nginx
# copy from the previous phase / step called builder
# copy from the folder /app/build to /usr/share/nginx/html which is the folder in which nginx image should host html by default 
COPY --from=builder /app/build /usr/share/nginx/html 
# it starts nginx by default as command
