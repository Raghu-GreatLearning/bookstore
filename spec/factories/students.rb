FactoryBot.define do
  factory :student do
    name { "MyString" }
    email { Faker::Internet.safe_email  }
    bookIssued { "MyString" }
    issuedDate { "2022-02-16" }
    returnDate { "2022-02-16" }
  end
end
