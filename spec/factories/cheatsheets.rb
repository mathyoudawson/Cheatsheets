FactoryBot.define do
  factory :cheatsheet do
    title { 'Test Cheatsheet' }
    description  { 'A test cheatsheet' }

    factory :cheatsheet_with_cheats do
      transient do
        cheats_count { 5 }
      end

      after(:create) do |cheatsheet, evaluator|
        create_list(:cheat, evaluator.cheats_count, cheatsheet: cheatsheet)
      end
    end
  end

  factory :cheat do
    sequence(:term){ |n| "Term#{n}" }
    sequence(:category){ |n| "Category#{n}" }
    sequence(:description){ |n| "Description#{n}" }
    association :cheatsheet, factory: :cheatsheet, first_name: "Jon"
  end
end
