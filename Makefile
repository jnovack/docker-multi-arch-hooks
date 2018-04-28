.PHONY: build all
.DEFAULT_GOAL := all

all: build

build:
	docker build \
	--build-arg VERSION=`git describe --tags --always` \
	--build-arg COMMIT=`git rev-parse HEAD` \
	--build-arg URL=`git config --get remote.origin.url` \
	--build-arg BRANCH=`git rev-parse --abbrev-ref HEAD` \
	--build-arg DATE=`date +%FT%T%z` \
	-t jnovack/dockerhub-hooks .
