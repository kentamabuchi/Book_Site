class Book < ApplicationRecord

  validates :name, presence: true
  validates :writer, presence: true
end
