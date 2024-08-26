ARG RUBY_VERSION=3.3.4
FROM ruby:${RUBY_VERSION}

ARG NODE_VERSION=22
ARG YARN_VERSION=1.22.22

RUN curl -sL https://deb.nodesource.com/setup_$NODE_VERSION.x | bash - \
  && apt-get update \
  && apt-get install --yes --no-install-recommends nodejs \
  && npm install -g yarn@$YARN_VERSION

ARG RAILS_VERSION
# Install Rails based on the version specified but if not specified, install the latest version.
RUN if [ -z "$RAILS_VERSION" ] ; then gem install rails ; else gem install rails -v $RAILS_VERSION ; fi
