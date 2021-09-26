# Build phase

FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Previous block completed
FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
# Default command start nginx for us!
# Dump everything we created on builder but /app/build



# docker build .
# docker run -p 8080:80 <imageId>
# 80: default nginx port