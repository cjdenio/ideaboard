FROM ruby:3-alpine

WORKDIR /usr/src/app

COPY . .

RUN bundle install

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true

RUN ./bin/rails assets:precompile

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]