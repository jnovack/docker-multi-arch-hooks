# This file is only necessary to include for Go projects.
# Must be included AFTER variables.mk

GO_LDFLAGS := "-w -s \
	-X github.com/jnovack/release.Application=${APPLICATION} \
	-X github.com/jnovack/release.BuildRFC3339=${BUILD_RFC3339} \
	-X github.com/jnovack/release.Package=${PACKAGE} \
	-X github.com/jnovack/release.Revision=${REVISION} \
	-X github.com/jnovack/release.Version=${VERSION} \
	"

# go-test tests all your code
.PHONY: go-test
go-test:
	go test -v ./... -race

# go-coverage generates code coverage
.PHONY: go-coverage
go-coverage:
	go test -v ./... -coverprofile=coverage.txt -covermode=atomic

# go-build builds your flagship application
.PHONY: go-build
go-build:
	go build -ldflags $(GO_LDFLAGS) cmd/${APPLICATION}/main.go

# go-update forces sum.golang.go and pkg.go.dev to update your repository version
.PHONY: go-update
go-update:
	curl https://sum.golang.org/lookup/github.com/${PACKAGE}@${VERSION}