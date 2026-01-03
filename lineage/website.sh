#!/bin/bash
set -e

if ! podman image exists lineageos/www; then
    echo "
    FROM docker.io/ruby:3.2

    WORKDIR /pwd
    RUN mkdir -p /.repo/projects/lineage/website.git
    RUN gem install bundler -v 2.4.10
    RUN bundle config set --local deployment true
    RUN bundle install
    " | podman build -t lineageos/www -v $PWD:/pwd:Z -
fi

podman run -v $PWD:/pwd:Z -p 4000:4000 -w /pwd -ti lineageos/www bundle exec jekyll serve --host 0.0.0.0 --future $@
