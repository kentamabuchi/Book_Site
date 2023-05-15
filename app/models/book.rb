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


  def self.follow_book(current_user, page)
    books = []
    current_user.followings.each do |user|

      user.favorites.each do |favorite|
        if favorite.present? && page == "book"
          book = Book.find_by(id: favorite.book_id)
          books.push(Book.find(favorite.book.id)) if !current_user.favorites.find_by(book_id: book.id).present?
        elsif favorite.present? && page == "follow"
          book = Book.find_by(id: favorite.book_id)
          books.push(Book.find(favorite.book.id))
        else
          return nil
        end
      end

    end
    books.uniq!
    return books.sample(6) if page == "book"
    return books if page == "follow"
  end

end
