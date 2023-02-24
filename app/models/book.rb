class Book < ApplicationRecord

  validates :name, presence: true
  validates :writer, presence: true
  attachment :image
  belongs_to :category
  belongs_to :genre
end
