# SWE550-as1

<img width="679" alt="Screen Shot 1443-03-16 at 10 30 31 AM" src="https://user-images.githubusercontent.com/92275217/139522760-d93223f5-2363-41e4-911c-280eb3e9fe51.png">

Docker provides lightweight containers to run services in isolation from our infrastructure so we can deliver software quickly. In our project we used Visual studio code tool, nodejs (JavaScript) Application and Mongodb will be deployed in two docker containers. And also these will then need to be running on same network so that they can communicate with each other.

Motivation:-

A Docker Compose environment was created in this project to configure and execute numerous Docker containers in a local environment.

Installation
1.	`npm init ` // install npm
2.	`npm install express -save `//web application framework for Node. js
3.	`npm install mongodb -save ` //install mongoose library for MongoDB.
4.	`docker-compose up ` //To start or restart all the services defined in a docker-compose.yml 
5.  `docker-compose stop `// To stop running containers but won’t remove them 
6.  `docker-compose down ` // To Stops containers and removes containers, networks, volumes, and images 



Code:-

Dockerfile defines a list of commands that Docker uses for setting up the Node.js application environment.

```
FROM node:10

WORKDIR /Users/reem/Downloads

COPY package*.json ./

RUN npm install

COPY . .

EXPOSE 3000

CMD ["npm", "node index.js"]
```

| DockerFile |
| ------------- |
| FROM lets us specify which base image from Docker Hub we want to build from. In our case, we are using the latest version of the official node image.      | 
| RUN lets us execute a command, which in our case is to create a new directory.     |
| WORKDIR sets this newly created directory as the working directory for any COPY, RUN and CMD instructions that follow in the Dockerfile. | 
| COPY is pretty straightforward and lets us copy files or a whole directory from a source to a destination. We are going to COPY the package.json file over to our working directory. | 
| RUN lets us execute the npm install command which will download all the dependencies defined in package.json. | 
| COPY lets us copy our entire local directory into our working directory to bundle our application source code. | 
| EXPOSE exposes a port which the container will listen on. | 
| And finally, CMD sets the default command to execute our container. | 





On the root of the project directory, we’re gonna create the docker-compose.yml file. Follow version 3 syntax defined by Docker:
```
version: '3'
services:
  app:
    container_name: docker-node-mongo
    restart: always
    build: .
    ports:
      - '70:3000'
    links:
      - mongo
  mongo:
    container_name: mongo 
    image: mongo
    ports:
     - '27017:27017' 
```








