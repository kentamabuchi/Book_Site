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
  has_many :report_books, dependent: :destroy


  def self.follow_book(main_user, page)
    books = []
    users = main_user.followings.includes(favorites: :book)
    users.each do |user|

      user.favorites.each do |favorite|
        if favorite.present? && page == "book"
          books.push(favorite.book) if !main_user.favorites.find_by(book_id: favorite.book.id).present?
        elsif favorite.present? && page == "follow"
          books.push(favorite.book)
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
