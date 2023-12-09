## Build lagoon-builder

### Build / Publish lagoon-builder 

docker build -t lagoon-builder .

docker tag lagoon-builder:latest sdedock/lagoon2container:builder-latest

docker push sdedock/lagoon2container:builder-latest

### Sample usage of lagoon-builder

docker run -it --rm \
    -v $HOME/DockerMounts/ls2i-nuget-cache:/root/.nuget/:rw \
    -v lagoon-app-build:/app/build/ \
    -e GIT_URL="http://REPO_TOKEN@repo.git" \
    lagoon-builder

## Build lagoon-runner 

### Build / Publish lagoon-runner 

docker build -t lagoon-runner .

docker tag lagoon-runner:latest sdedock/lagoon2container:runner-latest

docker push sdedock/lagoon2container:runner-latest

### Sample usage of lagoon-runner

docker run -it --rm \
    -v lagoon-app-build:/app \
    -e ConnectionStrings__LocalDb="Server=172.17.0.1;Database=lagoon-app;User Id=sa;Password=yourStrong#Password;TrustServerCertificate=True" \
    -e Lagoon__PublicUrl="http://localhost:8888" \
    -e ASPNETCORE_URLS="http://*:5000" \
    -p 8888:5000 \
    lagoon-runner

