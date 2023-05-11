class Book < ApplicationRecord

  validates :name, presence: true
  validates :writer, presence: true
  attachment :image
  belongs_to :category
  belongs_to :genre
  has_many :reviews, dependent: :destroy
  has_many :parents, class_name: "Review", foreign_key: :parent_id, dependent: :destroy
  has_many :replies, class_name: "Review", foreign_key: :parent_id, dependent: :destroy
  has_many :favorites, dependent: :destroy


  def self.follow_book_ranking(current_user)
    books = []
    current_user.followings.each do |user|

      user.reviews.each do |review|
        if review.present?
          book = Book.find_by(id: review.book_id)
          books.push(Book.find(review.book.id)) if book.present?
        else
          return nil
        end
      end

    end
    books.uniq!
    return books.sample(5)
  end

end
