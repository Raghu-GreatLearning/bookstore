class Student < ApplicationRecord
  validates :name, :email, :bookIssued, :issuedDate, :returnDate, presence: true
end
