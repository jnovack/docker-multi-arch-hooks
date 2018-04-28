FROM scratch

ARG BRANCH="none"
ARG COMMIT="local-build"
ARG DATE="1970-01-01T00:00:00Z"
ARG URL="https://github.com/jnovack/dockerhub-hooks"
ARG VERSION="dirty"

LABEL org.label-schema.schema-version="1.0" \
    org.label-schema.build-date=$DATE \
    org.label-schema.vendor="Justin J. Novack" \
    org.label-schema.name="jnovack/dockerhub-hooks" \
    org.label-schema.description="Sample Docker Hub Build Hooks" \
    org.label-schema.version="$VERSION" \
    org.label-schema.vcs-url=$URL \
    org.label-schema.vcs-branch=$BRANCH \
    org.label-schema.vcs-ref=$COMMIT

ENV BRANCH "$BRANCH"
ENV COMMIT "$COMMIT"
ENV DATE "$DATE"
ENV VERSION "$VERSION"
