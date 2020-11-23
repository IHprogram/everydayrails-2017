FactoryBot.define do
  factory :note do
    message = "My important note."
    message { message }
    association :project
    association :user
  end
end
