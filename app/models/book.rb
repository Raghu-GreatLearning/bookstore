class Book < ApplicationRecord
  validates :title, presence: true
  validates :author, presence: true
  validates :published_in, presence: true
  validates :volume, presence: true
end
