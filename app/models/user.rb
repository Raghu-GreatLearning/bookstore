class User < ApplicationRecord
  validates :email, presence: true
  validates :password, presence: true
  validates :confirm_password, presence: true
end
