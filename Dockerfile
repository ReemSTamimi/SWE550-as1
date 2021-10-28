FROM node:10

WORKDIR /Users/reem/Downloads

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "node index.js"]