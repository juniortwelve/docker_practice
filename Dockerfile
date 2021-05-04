FROM ruby:2.7.3

# install packages
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update && apt-get install -y mariadb-client --no-install-recommends && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev yarn

# setting workdir
RUN mkdir /docker_practice
WORKDIR /docker_practice

# add local files to vm
ADD Gemfile /docker_practice/Gemfile
ADD Gemfile.lock /docker_practice/Gemfile.lock

# volume the directory
RUN bundle install
ADD . /docker_practice
