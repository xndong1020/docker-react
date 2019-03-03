FROM node:alpine as builder 

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

# build folder will be inside container, under /app/build
RUN npm run build


FROM nginx

# copy from builder phase
COPY --from=builder /app/build /usr/share/nginx/html


