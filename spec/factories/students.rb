FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email  }
    book
  end

  factory :new_student do
    name { Faker::Name.name }
    email { Faker::Internet.safe_email }
    book_issued {'book'}
    issued_date {Faker::Date.between(from: '2014-09-23', to: '2014-09-25')}
    return_Date {Faker::Date.between(from: '2014-09-29', to: '2014-09-25')}
    book
  end
end
