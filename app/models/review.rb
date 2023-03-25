class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book
  belongs_to :parent, class_name: "Review", optional: true
  has_many :replies, class_name: "Review", foreign_key: :parent_id, dependent: :destroy
  has_many :good_reviews, dependent: :destroy
end
