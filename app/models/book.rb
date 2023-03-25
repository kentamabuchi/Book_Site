class Book < ApplicationRecord

  validates :name, presence: true
  validates :writer, presence: true
  attachment :image
  belongs_to :category
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :parents, class_name: "Review", foreign_key: :parent_id, dependent: :destroy
  has_many :replies, class_name: "Review", foreign_key: :parent_id, dependent: :destroy

end
