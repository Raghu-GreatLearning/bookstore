FactoryBot.define do
  factory :book do
    title { "MyTitle" }
    author { "MyAuthor" }
    published_in { 1 }
    volume { 1 }
  end
end
