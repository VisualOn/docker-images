FROM renovate/buildpack:2-focal@sha256:43ed014f2f667826499d8f0a90be3e3ba78afdc6237955a4538e376e632b8b89

LABEL maintainer="Michael Kriese <michael.kriese@visualon.de>" \
  org.opencontainers.image.authors="Michael Kriese <michael.kriese@visualon.de>" \
  org.opencontainers.image.licenses="MIT" \
  org.opencontainers.image.source="https://github.com/VisualOn/docker-images" \
  org.opencontainers.image.url="https://github.com/VisualOn/docker-images"

# install python and the packages the your code depends on along with jq so we can parse JSON
# add additional packages as necessary
RUN install-apt \
  jq \
  libgcc1 \
  libicu66 \
  ;

# renovate: datasource=docker versioning=docker
RUN install-tool docker 20.10.2

COPY src/ /

# renovate: datasource=github-releases lookupName=docker/compose
RUN install-tool docker-compose 1.27.4

# renovate: datasource=docker lookupName=hashicorp/terraform versioning=docker
RUN install-tool terraform 0.14.4

# renovate: datasource=docker lookupName=rancher/cli versioning=docker
RUN install-tool rancher-cli 0.6.14

# renovate: datasource=github-releases lookupName=actions/runner
RUN install-tool actions-runner 2.276.0


# renovate: datasource=github-tags depName=kubernetes/kubectl
RUN install-tool kubectl 1.20.1

WORKDIR /home/ubuntu/actions-runner

# set the entrypoint to the start.sh script
CMD ["start-runner.sh"]

ENV GITHUB_ACCESS_TOKEN=
ENV GITHUB_REPO=
ENV RUNNER_LABELS=
ENV RUNNER_NAME=

USER 1000