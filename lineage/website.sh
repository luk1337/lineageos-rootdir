#!/bin/bash
if ! docker image exists lineageos/www; then
    echo "
    FROM docker.io/ruby:3.2

    WORKDIR /pwd
    RUN mkdir -p /.repo/projects/lineage/website.git
    RUN gem install bundler -v 2.3.26
    RUN bundle install
    " | docker build -t lineageos/www -v $PWD:/pwd:Z -
fi

docker run -v $PWD:/pwd:Z -p 4000:4000 -w /pwd -ti lineageos/www bundle exec jekyll serve --host 0.0.0.0 --future $@
