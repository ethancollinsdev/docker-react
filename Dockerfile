# Build stage
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run stage
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html

# no explicit "run" command needed, nginx's 
# default command will run the build
