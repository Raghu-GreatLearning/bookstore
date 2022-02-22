class Student < ApplicationRecord
  validates :email, format: {with: /[a-z0-9]+@[a-z]+\.[a-z]{2,3}/}, presence: true
  validates :name, :bookIssued, :issuedDate, :returnDate, presence: true
end
