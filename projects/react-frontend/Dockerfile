# Got it form README.md
FROM node:16-alpine

WORKDIR /usr/src/app

# Moved 'serve' installation here for caching
RUN npm install -g serve

ENV REACT_APP_BACKEND_URL=http://localhost:8080

# port 5000 is reserved for sth else on my MacOS
EXPOSE 5010

# Package.json and Package-lock.json (since we're using npm)
COPY package*.json .

RUN npm install

COPY . .

RUN npm run build

CMD ["serve", "-s", "-l", "5010", "build"]