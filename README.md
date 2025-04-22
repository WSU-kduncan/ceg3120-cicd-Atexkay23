# README-CI for Docker Setup and Angular Application

## Docker Setup

### How to Install Docker for Your OS

1. **Windows**:
   - Download Docker Desktop for Windows from [Docker's official site](https://www.docker.com/products/docker-desktop).
   - Follow the installation instructions.
   - **Note**: Windows users need to enable WSL2 (Windows Subsystem for Linux) for Docker to run.

2. **macOS**:
   - Download Docker Desktop for macOS from [Docker's official site](https://www.docker.com/products/docker-desktop).
   - Follow the installation instructions.

3. **Linux**:
   - Install Docker using your package manager. For example, on Ubuntu:
     ```bash
     sudo apt-get update
     sudo apt-get install docker.io
     ```

4. **Verify Installation**:
   - Run the following command in the terminal:
     ```bash
     docker --version
     ```

---

## Manually Setting up a Container

### How to Run a Container to Test the Angular Application

```bash
docker run -d -p 4200:4200 atexkay23-docker
```

### Internal Container Setup

1. **Install Additional Dependencies**:
   ```bash
   npm install
   ```

2. **Run the Angular Application**:
   ```bash
   ng serve --host 0.0.0.0
   ```

### Verifying the Angular Application

1. **From the Container**:
   ```bash
   docker logs <container-id>
   ```

2. **From the Host Machine**:
   - Open your browser and visit http://localhost:4200.

## Dockerfile & Building Images

### Summary of Instructions in the Dockerfile

1. Set up the base image.
2. Install dependencies.
3. Copy the Angular application.
4. Run the Angular application.

### How to Build an Image from the Repository Dockerfile

```bash
docker build -t atexkay23-docker .
```

### How to Run a Container That Will Serve the Angular Application

```bash
docker run -d -p 4200:4200 atexkay23-docker
```

### Verifying the Angular Application

1. **From the Container**:
   ```bash
   docker logs <container-id>
   ```

2. **From the Host Machine**:
   - Open your browser and visit http://localhost:4200.

## Working with Your DockerHub Repository

### How to Create a Public Repo in DockerHub

1. Go to DockerHub.
2. Click on "Create Repository".
3. Set the repository visibility to Public.
4. Name the repository atexkay23-CEG3120.

### How to Create a Personal Access Token (PAT) for Authentication

1. Go to DockerHub and log in.
2. Click on your profile icon and select Account Settings.
3. Navigate to Security and generate a new Personal Access Token (PAT).

### How to Authenticate with DockerHub via CLI

```bash
docker login --username <your-dockerhub-username> --password <your-dockerhub-pat>
```

### How to Push the Container Image to Your DockerHub Repository

```bash
docker push atexkay23-docker
```

### Link to Your DockerHub Repository

https://hub.docker.com/r/atexkay23/atexkay23-docker
