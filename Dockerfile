FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y libvips sqlite3 libsqlite3-dev curl
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash -
RUN apt-get install -y nodejs
RUN npm install -g yarn

WORKDIR /rails

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY package.json ./
RUN npm install --ignore-scripts && npx cypress install --skip-binary 2>/dev/null || true

COPY . .

RUN CYPRESS_INSTALL_BINARY=0 bundle exec rails assets:precompile RAILS_ENV=production SECRET_KEY_BASE=placeholder

EXPOSE 3000

CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0", "-p", "3000"]
