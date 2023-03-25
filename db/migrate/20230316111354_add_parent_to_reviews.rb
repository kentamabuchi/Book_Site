class AddParentToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :parent, foreign_key: { to_table: :reviews }
  end
end
