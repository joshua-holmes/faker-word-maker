FROM ruby:2.7.4-alpine

RUN cat /etc/os-release

RUN apk update && apk upgrade
RUN apk add --no-cache build-base postgresql-dev postgresql-client bash tzdata


# Prepare working directory.
WORKDIR /ror
COPY ./ror /ror
RUN gem install bundler:2.3.4
RUN bundle install
RUN bundle add tzinfo-data
RUN bundle add tzinfo

# Prepare run file
COPY ./.docker/run-app /usr/bin/
RUN chmod +x /usr/bin/run-app

# # Configure endpoint.
COPY ./.docker/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

RUN echo $PATH
RUN which run-app
RUN bundle -v

CMD ["run-app"]