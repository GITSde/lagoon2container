update-base-images:
	docker pull mcr.microsoft.com/dotnet/aspnet:6.0-alpine3.18
	docker pull mcr.microsoft.com/dotnet/sdk:6.0-alpine3.18

build-images:
	# builder
	docker build -t lagoon-builder:latest ./src/builder/
	docker tag lagoon-builder:latest sdedock/lagoon2container:builder-latest
	# runner
	docker build -t lagoon-runner:latest ./src/runner/
	docker tag lagoon-runner:latest sdedock/lagoon2container:runner-latest

publish-images:
	docker push sdedock/lagoon2container:builder-latest
	docker push sdedock/lagoon2container:runner-latest

build-push: update-base-images build-images publish-images

test-up:
	cd test && docker compose up -d

test-down:
	cd test && docker compose down
	docker volume rm lagoon2container-test_lagoon-app-test
