# spec/factories/users.rb
FactoryBot.define do
  factory :user do
    email { 'adham@example.com' }
    password { '123456' }
  end
end
