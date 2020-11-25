FactoryBot.define do
  factory :user, aliases: [:owner] do
    first_name = "Aaron"
    first_name { first_name }
    last_name = "Sumner"
    last_name { last_name }
    # sequence(:email) { |n| "tester#{n}@example.com" }
    email { Faker::Internet.free_email }
    password = "dottle-nouveau-pavilion-tights-furze"
    password { password }
  end
end
