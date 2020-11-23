FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description = "A test project."
    description { description }
    due_on = 1.week.from_now
    due_on { due_on }
    association :owner
  end

  # 昨日が締め切りのプロジェクト
  factory :project_due_yesterday, class: Project do
    sequence(:name) { |n| "Test Project #{n}" }
    description = "Sample project for testing purposes"
    description { description }
    due_on = 1.day.ago
    due_on { due_on }
    association :owner
  end

  # 今日が締め切りのプロジェクト
  factory :project_due_today, class: Project do
    sequence(:name) { |n| "Test Project #{n}" }
    description "Sample project for testing purposes"
    description { description }
    due_on Date.current.in_time_zone
    due_on { due_on }
    association :owner
  end
  

  # 明日が締め切りのプロジェクト
  factory :project_due_tomorrow, class: Project do
    sequence(:name) { |n| "Test Project #{n}" }
    description = "Sample project for testing purposes"
    description { description }
    due_on = 1.day.from_now
    due_on { due_on }
    association :owner
  end
end
