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

# Part 2 - GitHub Actions and DockerHub

## Configuring GitHub Repository Secrets

### How to create a PAT for authentication
1. Visit [GitHub Personal Access Token](https://github.com/settings/tokens).
2. Click on **Generate new token**.
3. Select the appropriate scopes for your use case:
   - For DockerHub, select read:packages and write:packages.
   - Set the expiration for the token (e.g., 90 days).
4. Click **Generate token** and save it in a safe place.

### How to set repository Secrets for use by GitHub Actions
1. Go to your GitHub repository and click on **Settings**.
2. In the left sidebar, click on **Secrets and variables** and then **Actions**.
3. Click **New repository secret**.
4. Set the **Name** and **Value** of the secrets as follows:
   - **DOCKER_USERNAME**: Your DockerHub username.
   - **DOCKER_TOKEN**: The Personal Access Token you generated on DockerHub.
5. Click **Add secret** to save each one.

### Describe the Secrets set for this project
- **DOCKER_USERNAME**: Stores the username for authenticating with DockerHub.
- **DOCKER_TOKEN**: Stores the DockerHub Personal Access Token (PAT) used for authentication in the GitHub Actions workflow.

---

## CI with GitHub Actions

### Summary of what your workflow does and when it does it
This GitHub Actions workflow automatically builds and pushes a Docker image to DockerHub every time a commit is pushed to the main branch. It leverages DockerHub credentials stored in GitHub repository secrets to authenticate, build the image using the Dockerfile, and push the image to your DockerHub repository.

### Explanation of workflow steps
1. **Trigger**: The workflow is triggered on a push to the main branch.
2. **Setup Docker**: The workflow uses the docker/setup-buildx-action to set up Docker Buildx for multi-platform builds.
3. **Login to DockerHub**: The workflow authenticates with DockerHub using the DOCKER_USERNAME and DOCKER_TOKEN stored as repository secrets.
4. **Build and Push Docker Image**: The workflow builds the Docker image from the Dockerfile and pushes it to DockerHub using the docker/build-push-action.

### Explanation / highlight of values that need updated if used in a different repository
- **Workflow changes**:
  - The repository name in the workflow YAML needs to be updated to match your project repository.
- **Repository changes**:
  - The DOCKER_USERNAME and DOCKER_TOKEN secrets need to be updated for different repositories.
  - The DockerHub repository name should be updated in the workflow file to match the new repository.

### Link to workflow file in your GitHub repository
You can find the workflow file at: [.github/workflows/docker-image.yml](https://github.com/your-username/your-repository/blob/main/.github/workflows/docker-image.yml)

---

## Testing & Validating

### How to test that your workflow did its tasking
- Push a commit to the main branch of your repository.
- Check the **Actions** tab in your GitHub repository to see if the workflow runs successfully.
- Ensure that the workflow builds and pushes the Docker image to DockerHub.

### How to verify that the image in DockerHub works when a container is run using the image
1. Log into DockerHub and find the pushed image in your repository.
2. Copy the image name.
3. Run the following command to pull and run the image:
```bash
docker run -d -p 80:80 your-dockerhub-username/image-name
```
