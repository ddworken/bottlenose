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
sudo -i -u vagrant git clone https://github.com/rbenv/rbenv.git /home/vagrant/.rbenv
sudo -i -u vagrant git clone https://github.com/rbenv/ruby-build.git /home/vagrant/.rbenv/plugins/ruby-build
sudo -i -u vagrant /home/vagrant/.rbenv/bin/rbenv init -
# Install ruby
sudo -i -u vagrant /home/vagrant/.rbenv/bin/rbenv install
# Install bundler
sudo -i -u vagrant gem install bundler
sudo -i -u vagrant rbenv rehash
# Install bottlenose's dependencies
sudo -i -u vagrant bundle install
# Create the database.
sudo -i -u vagrant rake db:create
# Run database migrations.
sudo -i -u vagrant rake db:migrate
