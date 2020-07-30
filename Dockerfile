# Build stage
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run stage
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

# no explicit "run" command needed, nginx's 
# default command will run the build
