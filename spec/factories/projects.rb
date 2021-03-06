FactoryBot.define do
  factory :project do
    sequence(:name) { |n| "Project #{n}" }
    description = "A test project."
    description { description }
    due_on = 1.week.from_now
    due_on { due_on }
    association :owner

    # with_noteは、新しいプロジェクトを作成した後にメモファクトリ(note)を使って5つの新しいメモを追加する。
    #コールバック
    trait :with_notes do
      after(:create) { |project| create_list(:note, 5, project: project) }
    end

    # 昨日が締め切りのプロジェクト
    trait :due_yesterday do
      due_on = 1.day.ago
      due_on { due_on }
    end

    # 今日が締め切りのプロジェクト
    trait :due_today do
      due_on = Date.current.in_time_zone
      due_on { due_on }
    end

    # 明日が締め切りのプロジェクト
    trait :due_tomorrow do
      due_on = 1.day.from_now
      due_on { due_on }
    end

    trait :invalid do
      name { nil }
    end
  end
end