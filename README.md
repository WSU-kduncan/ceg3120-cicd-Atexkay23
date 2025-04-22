# Part 1: 

## Installing Docker

### Windows
- Get Docker Desktop: [Download here](https://www.docker.com/products/docker-desktop)
- Install and enable WSL2

### macOS
- Get Docker Desktop: [Download here](https://www.docker.com/products/docker-desktop)
- Follow installation steps

### Linux
```bash
sudo apt-get update
sudo apt-get install docker.io
```

### Check installation
```bash
docker --version
```

## Running a Container Manually

Run the container:
```bash
docker run -d -p 4200:4200 atexkay23-docker
```

Inside the container:
```bash
npm install
ng serve --host 0.0.0.0
```

Check if it works:
- Container logs: `docker logs <container-id>`
- Browser: http://localhost:4200

## Building from Dockerfile

Our Dockerfile:
1. Sets base image
2. Installs dependencies
3. Copies app files
4. Runs Angular

Build the image:
```bash
docker build -t atexkay23-docker .
```

Run it:
```bash
docker run -d -p 4200:4200 atexkay23-docker
```

## DockerHub Setup

Create a repo:
1. Go to DockerHub
2. Create Repository (Public)
3. Name it atexkay23-CEG3120

Get a token:
1. Account Settings
2. Security
3. Generate PAT

Login and push:
```bash
docker login --username <your-username> --password <your-pat>
docker push atexkay23-docker
```

DockerHub link: https://hub.docker.com/r/atexkay23/atexkay23-docker
