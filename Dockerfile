FROM ruby:3-alpine

WORKDIR /usr/src/app

COPY . .

RUN bundle install

ENV RAILS_ENV production

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]