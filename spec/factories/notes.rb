FactoryBot.define do
  factory :note do
    message = "My important note."
    message { message }
    association :project
    # ユーザーが一人だけしか作成されないようにするため。
    user { projects.owner }
  end
end
