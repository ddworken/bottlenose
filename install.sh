#!/usr/bin/env bash

# cd into /vagrant which contains all of our files
cd /vagrant
# Install all of the dependencies via apt
sudo apt-get -y install git vim curl postgresql build-essential libssl-dev libreadline-dev zlib1g-dev libpq-dev qt4-default
# Switch to the postgres server and create the bottlenose user
sudo -i -u postgres createuser -d bottlenose
# Setup pg_hba.conf to disable authentication
sudo sh -c 'echo "local   all             postgres                                trust
local   all             all                                     trust
host    all             all             127.0.0.1/32            trust
host    all             all             ::1/128                 trust" > /etc/postgresql/9.4/main/pg_hba.conf'
sudo service postgresql restart
# Install rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
/home/vagrant/.rbenv/bin/rbenv init -
# Install ruby
/home/vagrant/.rbenv/bin/rbenv install
# Install bundler
gem install bundler
rbenv rehash
# Install bottlenose's dependencies
bundle install
# Create the database.
rake db:create
# Run database migrations.
rake db:migrate
