FROM ruby:2.6.5

# Install image dependencies
RUN apt-get update -qq && apt-get install -y iputils-ping

WORKDIR /wakeo_test
COPY Gemfile* /wakeo_test/
RUN gem install bundler --pre
RUN bundle install

# Add a script to be executed every time the container starts.
COPY docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
ENV PORT 6001
EXPOSE 6001
