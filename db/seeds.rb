require 'devise/encryptor'

[Course, Bucket, Assignment, Registration].each do |model|
  model.reset_column_information
end

def random(arr)
  arr[rand(arr.count)]
end

def pwhash(pw)
  Devise::Encryptor.digest(User, pw)
end

exit(0) unless (Rails.env == "development")
  
nat = User.create!(
  username: "ntuck",
  first_name: "Nat",
  last_name: "Tuck",
  nickname: "Nat",
  site_admin: true,
  encrypted_password: pwhash("bacon88"),
)

ben = User.create!(
  username: "blerner",
  first_name: "Ben",
  last_name: "Lerner",
  nickname: "Ben",
  site_admin: true,
  encrypted_password: pwhash("bacon99"),
)
