# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
require 'securerandom'
require 'fileutils'

key_file = File.expand_path("~/.config/bottlenose/rails_key").to_s
unless File.exists?(key_file)
  FileUtils.mkdir_p(File.dirname(key_file))
  kk = File.open(key_file, 'wb')
  6.times do
    kk.write(SecureRandom.urlsafe_base64)
  end
  kk.close
end

Bottlenose::Application.config.secret_token = File.open(key_file).read
