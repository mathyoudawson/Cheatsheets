FactoryBot.define do
  factory :user do
    name 'John'
    email 'john@doe.com'
    password 'foobar'
    password_confirmation 'foobar'
  end

  factory :random_user do
    password = Faker::Internet.password
    name { Faker::Name.name }
    email  { Faker::Internet.email }
    password { password }
    password_confirmation { password }
  end
end
