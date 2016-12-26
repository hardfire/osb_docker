FROM ruby:2.0.0
RUN apt-get update -qq && apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev libncurses5-dev automake libtool bison libffi-dev imagemagick libmagickcore-dev libmagickwand-dev libicu-dev mysql-client libmysqlclient-dev
RUN gem install rails -v 4.1.8
RUN git clone https://github.com/hardfire/open-source-billing /open-source-billing
WORKDIR /open-source-billing
RUN bundle install
ADD database.yml /open-source-billing/config/database.yml
ADD config.yml /open-source-billing/config/config.yml
ADD secrets.yml /open-source-billing/config/secrets.yml
#RUN rake db:create RAILS_ENV=production
#RUN rake db:migrate RAILS_ENV=production
#RUN rake db:seed RAILS_ENV=production
#RUN rails server -e production
