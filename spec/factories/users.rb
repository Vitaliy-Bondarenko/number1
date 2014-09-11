FactoryGirl.define do
  factory :user do
    fname { Faker::Name.first_name }
    lname { Faker::Name.last_name }
    email { Faker::Internet.email }
    password { Faker::Internet.password(8) }
    age { '28' }
    password_salt { BCrypt::Engine.generate_salt }
    password_hash { BCrypt::Engine.hash_secret(password, password_salt) }
    active_code "active"
  end
end