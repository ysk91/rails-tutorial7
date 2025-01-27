FactoryBot.define do
  factory :user do
    name { "Example User" }
    email { "user@example.com" }
    password { "P@ssw0rd" }
    password_confirmation { "P@ssw0rd" }
  end
end
