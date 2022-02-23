FactoryBot.define do
  factory :issued_book do
    book { nil }
    student { nil }
    association :user
    association :student
  end
end
