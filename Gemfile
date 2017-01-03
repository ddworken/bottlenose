# -*- ruby -*-
source 'https://rubygems.org'
ruby "~> 2.4.0"

gem 'rails', git: 'https://github.com/rails/rails.git', tag: '5-0-stable'
gem 'rack'
gem 'i18n'

gem 'devise'
#gem 'devise_ldap_authenticatable'

gem 'pg'

#gem 'execjs'
#gem 'therubyracer'

gem 'yaml_db'

gem 'activerecord-import'

gem 'coffee-rails'
gem 'coffee-rails-source-maps'
gem 'uglifier'
gem 'jquery-rails'
gem 'jquery-tablesorter'

gem 'bootstrap-sass'
gem 'sass-rails'
gem 'bootstrap-sass-extras'
gem 'bootstrap-datepicker-rails'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails'
gem 'font-awesome-rails'
#gem 'zipruby'
#gem 'zipruby-compat', :require => 'zipruby', :git => "https://github.com/jawspeak/zipruby-compatibility-with-rubyzip-fork.git", :tag => "v0.3.7" # needed instead of zipruby because write_xlsx needs rubyzip, and they conflict

gem 'delayed_job_active_record'
gem 'daemons'

gem 'write_xlsx'

gem 'whenever', :require => false

gem 'pretender'

gem 'codemirror-rails'

group :development do
  gem "better_errors"
  gem "binding_of_caller"
  #gem "flatten_migrations"
end

group :development, :test do
  gem 'pry'
  gem 'pry-rails'
end

group :test do
  gem 'rails-controller-testing'
  gem 'simplecov', git: "https://github.com/colszowka/simplecov.git"
  gem 'database_cleaner'
  gem 'capybara'
  gem 'capybara-webkit' # Needs qt5-default qt5-qmake libqt5webkit5-dev
  gem 'launchy'
  gem 'factory_girl_rails'
end
