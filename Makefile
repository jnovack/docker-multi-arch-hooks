PACKAGE := $(shell git remote get-url --push origin | sed -E 's/.+[@|/](.+)\.(.+).git/\1.\2/' | sed 's/\:/\//')
APPLICATION := $(shell basename `pwd`)
BRANCH := $(shell git rev-parse --abbrev-ref HEAD)
BUILD_RFC3339 := $(shell date -u +"%Y-%m-%dT%H:%M:%S+00:00")
COMMIT := $(shell git rev-parse HEAD)
VERSION := $(shell git describe --tags)
DESCRIPTION :=$(shell curl -s https://api.github.com/repos/${DOCKER_REPO} \
    | grep '"description".*' \
    | head -n 1 \
    | cut -d '"' -f 4)

DOCKER_BUILD_ARGS := \
	--build-arg PACKAGE=${PACKAGE} \
	--build-arg APPLICATION=${APPLICATION} \
	--build-arg BUILD_RFC3339=v${BUILD_RFC3339} \
	--build-arg COMMIT=${BRANCH}/${COMMIT} \
	--build-arg DESCRIPTION=${DESCRIPTION} \
	--build-arg VERSION=${VERSION} \
	--progress auto

IMAGE?=jnovack/docker-multi-arch-hooks

.PHONY: build all
.DEFAULT_GOAL := all

all: build

build:
	docker rmi ${APPLICATION}:${BRANCH} || true
	docker build ${DOCKER_BUILD_ARGS} -t ${APPLICATION}:${BRANCH} .
