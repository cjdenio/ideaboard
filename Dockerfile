FROM ruby:3.0.0

WORKDIR /usr/src/app

COPY . .

RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
	 apt-get install -y nodejs

RUN npm install -g yarn

RUN bundle install
RUN yarn install

ENV RAILS_ENV production
ENV RAILS_SERVE_STATIC_FILES true

RUN ./bin/rails db:migrate
RUN ./bin/rails assets:precompile

CMD ["./bin/rails", "server", "-b", "0.0.0.0"]
