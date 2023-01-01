FROM ruby:2.7.0
RUN apt-get update -qq && \
  apt-get install -y build-essential \
  libpq-dev \
  nodejs
RUN mkdir /Book_Site
RUN gem install bundler
WORKDIR /Book_Site
COPY Gemfile /Book_Site/Gemfile
COPY Gemfile.lock /Book_Site/Gemfile.lock
RUN bundle install
COPY . /Book_Site
